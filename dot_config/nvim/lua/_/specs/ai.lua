--
-- This module bundles ai related plugins
--
return {
  {
    'wincent/shannon',
    cmd = { "Shannon", "ShannonNextMark", "ShannonPreviousMark", "ShannonClearMarks" },
    keys = {
      { "<leader>cc", "<cmd>Shannon<cr>", desc = "Agent Chat" },
    },
    config = function()
      require('wincent.shannon').setup({
        keymaps = false,
        agents = { 'claude', 'claude-darwin-arm64', 'opencode' },
      })
    end,
  },
}
