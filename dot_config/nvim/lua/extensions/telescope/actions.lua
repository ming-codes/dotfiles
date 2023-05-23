return {
  -- watch https://github.com/nvim-telescope/telescope.nvim/issues/1048
  -- ["<C-v>"] = function(...) end -- TODO open all selection as v split
  -- ["<C-t>"] = function(...) end -- TODO open all selection as v split in new tab
  file_vsplit = function(...)
    return require("telescope.actions").file_vsplit(...)
  end,
  file_tab = function(prompt_bufnr)
    local action_set = require "telescope.actions.set"

    return action_set.edit(prompt_bufnr, "tabedit")
  end,
}
