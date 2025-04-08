local all_buffers = function()
  return vim.tbl_filter(function(buf)
    return vim.api.nvim_buf_is_valid(buf)
        and vim.api.nvim_buf_get_option(buf, 'buflisted')
  end, vim.api.nvim_list_bufs())
end

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
  delete_buffer = require('telescope.actions').delete_buffer,
  delete_buffer_wip = function(bufnr)
    -- local force = vim.api.nvim_buf_get_option(selection.bufnr, "buftype") == "terminal"

    -- vim.api.nvim_buf_delete, selection.bufnr, { force = force })
  end
}
