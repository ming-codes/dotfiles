-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local tmpdir = os.getenv("TMPDIR")

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.go.background = "light"

require("_.o")

vim.on_key(function(char)
  if vim.fn.mode() == "n" then
    local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
    if vim.opt.hlsearch:get() ~= new_hlsearch then
      vim.opt.hlsearch = new_hlsearch
    end
  end
end, vim.api.nvim_create_namespace("auto_hlsearch"))

-- assign = function(to, from)
--   for key, value in pairs(from) do
--     to[key] = value
--   end
-- end,
-- each = function(tbl, it)
--   for key, value in pairs(tbl) do
--     it(value, key)
--   end
-- end,
-- i_each = function(tbl, it)
--   for key, value in ipairs(tbl) do
--     it(value, key)
--   end
-- end,
table.combine = function(...)
  local it = { ... }

  local ret = {}
  local idx = 1

  for _, tbl in pairs(it) do
    for _, value in pairs(tbl) do
      ret[idx] = value
      idx = idx + 1
    end
  end

  return ret
end
table.map = function(tbl, it)
  local ret = {}

  for key, value in pairs(tbl) do
    ret[key] = it(value, key)
  end

  return ret
end
-- i_map = function(tbl, it)
--   local ret = {}
--
--   for key, value in ipairs(tbl) do
--     ret[key] = it(value, key)
--   end
--
--   return ret
-- end,
-- filter = function(tbl, it)
--   local ret = {}
--
--   for key, value in pairs(tbl) do
--     if (it(value, key)) then
--       ret[key] = value
--     end
--   end
--
--   return ret
-- end,
-- i_flat_map = function(tbl, it)
--   local ret = {}
--
--   for key, value in ipairs(tbl) do
--     local child = it(value, key)
--
--     for _, value in ipairs(child) do
--       ret[#ret + 1] = value
--     end
--   end
--
--   return ret
-- end,
-- group_by = function(tbl, it)
--   local ret = {}
--
--   for key, value in pairs(tbl) do
--     local group = it(value, key)
--
--     if (ret[group] == nil) then
--       ret[group] = {}
--     end
--
--     table.insert(ret[group], value)
--   end
--
--   return ret
-- end,
-- slice = function(tbl, from, to)
--   local ret = {}
--
--   if (to == nil) then
--     to = #tbl + 1
--   elseif (to < 0) then
--     to = #tbl + to + 1
--   end
--
--   if (from == nil) then
--     from = 1
--   end
--
--   for index, value in ipairs(tbl) do
--     if (index >= from and index < to) then
--       table.insert(ret, value)
--     end
--   end
--
--   return ret
-- end,
-- find = function(tbl, it)
--   for key, value in pairs(tbl) do
--   end
-- end

require("lazy").setup({
  spec = table.combine(
    require('plugin-specs'),
    require('_.specs.ai'),
    require('_.specs.ui'),
    require('_.specs.motion'),
    require('_.specs.dap'),
    require('_.specs.code'),
    require('_.specs.dev')
  ),
  install = { colorscheme = { "PaperColor" } },
})

-- plugin groups
-- dap
-- lsp: mason, lsp, saga
-- lines
