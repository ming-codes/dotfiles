--
-- This module bundles ai related plugins
--
return {
  {
    'wincent/shannon',
    event = "VeryLazy",
    cmd = { "Shannon", "ShannonNextMark", "ShannonPreviousMark", "ShannonClearMarks" },
    keys = {
      { "<leader>cc", "<cmd>Shannon<cr>",            desc = "Agent Chat", mode = { "n", "v" } },
      { "[c",         "<cmd>ShannonPreviousMark<cr>" },
      { "]c",         "<cmd>ShannonNextMark<cr>" },
    },
    config = function()
      require('wincent.shannon').setup({
        keymaps = false,
        agents = { 'claude', 'claude-darwin-arm64', 'opencode' },
      })
    end,
  },
}
