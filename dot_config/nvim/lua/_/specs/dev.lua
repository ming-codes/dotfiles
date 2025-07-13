return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "rafcamlet/nvim-luapad",
    cmd = { "Luapad", "LuaRun" },
    keys = {
      { "<leader>zp", "<cmd>Luapad<cr>" }
    }
  },
}
