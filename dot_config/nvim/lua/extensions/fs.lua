return {
    -- M.get_cursor_entry = function()
    -- M.get_current_dir = function()
  -- normalize Oil, netrw, and plain buffer
  get_buffer_abspath = function(bufnr)
    local ret = require("oil").get_current_dir() or vim.fn.expand("%:p")
    vim.notify(ret)
    return ret
  end,
  get_line_abspath = function()
    local oil = require("oil")
    local entry = oil.get_cursor_entry()

    if (entry ~= nil) then
      return oil.get_current_dir() .. "/" .. entry.name
    end

    return oil.get_current_dir() .. "/" .. entry.name
  end,
  get_context_abspath = function()
  end,
}
