-- Drop-in replacement for hover.providers.lsp: one provider per attached LSP client, plus
-- ts_ls enhancements. ts_ls hover cannot expand, so interfaces show their full body and
-- overloaded functions show every signature. Loaded by name from the hover.nvim `providers` option.
local api = vim.api
local lsp = vim.lsp

--- @type table<integer, Hover.Provider?> -- client_id -> provider
local lsp_providers = {}

--- @param client vim.lsp.Client
--- @param bufnr integer
--- @param pos [integer,integer]
--- @return lsp.TextDocumentPositionParams
local function create_params(client, bufnr, pos)
  local row, col = pos[1] - 1, pos[2]
  local line = api.nvim_buf_get_lines(bufnr, row, row + 1, true)[1] or ""
  col = math.min(col, #line)

  return {
    textDocument = { uri = vim.uri_from_bufnr(bufnr) },
    position = {
      line = row,
      character = vim.str_utfindex(line, client.offset_encoding, col),
    },
  }
end

-- ts_ls returns only the identifier span, so read forward until the closing brace
local function read_declaration(buf, start)
  local all = vim.api.nvim_buf_get_lines(buf, start, start + 60, false)
  local lines, depth, opened = {}, 0, false
  for _, l in ipairs(all) do
    lines[#lines + 1] = l
    local code = l:gsub("//.*", "")
    for c in code:gmatch("[{}]") do
      depth = depth + (c == "{" and 1 or -1)
      opened = opened or c == "{"
    end
    if (opened and depth <= 0) or (not opened and code:match(";%s*$")) then break end
  end
  if #lines == 0 or depth > 0 then return nil end
  return lines
end

-- All overload signatures of the function or method declared at (line, col).
-- tsserver resolves a call to a single declaration, so walk the syntax tree for siblings.
local overload_types = {
  function_signature = true,
  method_signature = true,
  function_declaration = true,
  method_definition = true,
  generator_function_declaration = true,
}
local function overloads(buf, line, col)
  local ok, parser = pcall(vim.treesitter.get_parser, buf)
  if not ok or not parser then return {} end
  local root = parser:parse()[1]:root()
  local node = root:named_descendant_for_range(line, col, line, col)
  while node and not overload_types[node:type()] do node = node:parent() end
  if not node then return {} end
  local name_node = node:field("name")[1]
  if not name_node then return {} end
  local name = vim.treesitter.get_node_text(name_node, buf)
  local outer = node:parent()
  if outer and outer:type() == "export_statement" then outer = outer:parent() end
  if not outer then return {} end

  local found = {}
  for child in outer:iter_children() do
    local decl = child
    if child:type() == "export_statement" then decl = child:field("declaration")[1] or child end
    local sig_name = decl:field("name")[1]
    local is_sig = decl:type() == "function_signature" or decl:type() == "method_signature"
    if is_sig and sig_name and vim.treesitter.get_node_text(sig_name, buf) == name then
      local text = vim.treesitter.get_node_text(child, buf)
      found[#found + 1] = {
        lines = vim.split(text, "\n"),
        doc = nil,
        row = child:start(),
      }
    end
  end
  return found
end

-- JSDoc block directly above the line, shown below the code like ts_ls docs
local function jsdoc(buf, line)
  local doc = {}
  local above = vim.api.nvim_buf_get_lines(buf, math.max(line - 60, 0), line, false)
  if #above > 0 and above[#above]:match("%*/%s*$") then
    for i = #above, 1, -1 do
      table.insert(doc, 1, (above[i]:gsub("^%s*/?%*+/?%s?", ""):gsub("%s*%*/%s*$", "")))
      if above[i]:match("^%s*/%*%*") then break end
    end
  end
  return vim.trim(table.concat(doc)) ~= "" and doc or nil
end

local function locate(item)
  local uri = item and (item.uri or item.targetUri)
  local range = item and (item.range or item.targetRange)
  if not uri or not range then return nil end
  local buf = vim.uri_to_bufnr(uri)
  vim.fn.bufload(buf)
  return buf, range.start.line
end

local function fence(md, lines, doc)
  if #md > 0 then vim.list_extend(md, { "", "---", "" }) end
  vim.list_extend(md, { "```typescript" })
  vim.list_extend(md, lines)
  table.insert(md, "```")
  if doc then vim.list_extend(md, doc) end
end

-- ts_ls hover for overloaded functions, interface-typed values, or plain hover text.
--- @param client vim.lsp.Client
--- @param rp lsp.TextDocumentPositionParams
--- @param bufnr integer
--- @param hover_lines string[] plain hover content, used when there is nothing more to show
--- @param done fun(result?: false|Hover.Provider.Result)
local function enhance_ts(client, rp, bufnr, hover_lines, done)
  local function fallback()
    done({ lines = hover_lines, filetype = "markdown" })
  end

  -- ts_ls marks overloaded functions with "(+N overload(s))"
  if table.concat(hover_lines, "\n"):match("%(%+%d+ overloads?%)") then
    return client:request("textDocument/definition", rp, function(err, result)
      if err or not result then return fallback() end
      local item = vim.islist(result) and result[1] or result
      local buf = locate(item)
      local range = item and (item.range or item.targetSelectionRange or item.targetRange)
      local signatures = buf and overloads(buf, range.start.line, range.start.character) or {}
      if #signatures < 2 then return fallback() end
      local md = {}
      for _, sig in ipairs(signatures) do fence(md, sig.lines, jsdoc(buf, sig.row)) end
      done({ lines = md, filetype = "markdown" })
    end, bufnr)
  end

  client:request("textDocument/typeDefinition", rp, function(err, result)
    if err or not result then return fallback() end
    -- primitives like `string` give an empty list, which must not reach uri_to_bufnr
    local buf, line = locate(vim.islist(result) and result[1] or result)
    local lines = buf and read_declaration(buf, line)
    -- functions resolve to themselves, so expand interfaces only
    local head = lines and lines[1]:gsub("^%s*", ""):gsub("^export%s+", ""):gsub("^declare%s+", "")
    if not head or not head:match("^interface%s") then return fallback() end
    local md = {}
    fence(md, lines, jsdoc(buf, line))
    done({ lines = md, filetype = "markdown" })
  end, bufnr)
end

--- @param client vim.lsp.Client
local function register_lsp_provider(client)
  if not client:supports_method("textDocument/hover") then
    return
  end

  lsp_providers[client.id] = {
    name = client.name,
    enabled = function(bufnr)
      local c = lsp.get_clients({ id = client.id, bufnr = bufnr, method = "textDocument/hover" })[1]
      return c ~= nil
    end,
    execute = function(params, done)
      local rparams = create_params(client, params.bufnr, params.pos)
      client:request("textDocument/hover", rparams, function(err, result)
        --- @cast result lsp.Hover?
        if err then
          done({ lines = { "Error: " .. vim.inspect(err) } })
        elseif not result or not result.contents then
          done()
        else
          local lines = lsp.util.convert_input_to_markdown_lines(result.contents)
          if vim.tbl_isempty(lines) then
            lines = { "empty" }
          end
          if client.name == "ts_ls" then
            enhance_ts(client, rparams, params.bufnr, lines, done)
          else
            done({ lines = lines, filetype = "markdown" })
          end
        end
      end, params.bufnr)
    end,
  }
end

--- @type Hover.Provider[]
local providers = {}

local function add_client(client)
  if lsp_providers[client.id] then return end
  register_lsp_provider(client)
  if lsp_providers[client.id] then
    providers[#providers + 1] = lsp_providers[client.id]
  end
end

api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    add_client(assert(lsp.get_client_by_id(args.data.client_id)))
  end,
})

for _, client in pairs(lsp.get_clients()) do
  add_client(client)
end

return {
  name = "LSP",
  priority = 1000,
  providers = providers,
}
