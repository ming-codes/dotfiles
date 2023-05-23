return {
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    opts = {
      mapping = { "<<" },
      timeout = 300
    }
  },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    init = function()
      require("leap").add_default_mappings()
    end
  },
  { "tpope/vim-repeat", event = "VeryLazy" },
}
