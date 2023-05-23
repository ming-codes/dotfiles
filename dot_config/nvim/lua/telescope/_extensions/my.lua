local search_cb_jump = function(self, bufnr, query)
  if not query then
    return
  end
  vim.api.nvim_buf_call(bufnr, function()
    pcall(vim.fn.matchdelete, self.state.hl_id, self.state.winid)
    vim.cmd "norm! gg"
    vim.fn.search(query, "W")
    vim.cmd "norm! zz"

    self.state.hl_id = vim.fn.matchadd("TelescopePreviewMatch", query)
  end)
end

local search_teardown = function(self)
  if self.state and self.state.hl_id then
    pcall(vim.fn.matchdelete, self.state.hl_id, self.state.hl_win)
    self.state.hl_id = nil
  end
end

return require("telescope").register_extension {
  setup = function(ext_config, config)
    -- access extension config and user config
  end,
  exports = {
    -- git_diff_main
    git_diff = function(opts)
      local builtin = require "telescope.builtin"
      local actions = require "telescope.actions"
      local action_state = require "telescope.actions.state"
      local previewers = require "telescope.previewers"
      local str = require "utils.string"
      local putils = require "telescope.previewers.utils"
      local cwd = vim.fn.getcwd();

      local extensions = require("extensions.telescope")

      if (opts.ref ~= nil) then
        extensions.git_diff(opts)
      else
        builtin.git_commits {
          prompt_title = 'Refs',
          previewer = previewers.git_branch_log.new(opts),
          git_command = { "git", "show-ref", "--abbrev" },

          attach_mappings = function(_, map)
            actions.select_default:replace(function(prompt_bufnr)
              local entry = action_state.get_selected_entry()
              local hash = entry.value

              actions.close(prompt_bufnr)

              builtin.git_files {
                git_command = { "git", "diff", hash, "--name-only", "--relative" },
              }
            end)
            return true
          end
        }
      end
    end
  },
}
