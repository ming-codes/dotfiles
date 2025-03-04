return {
  {
    "max397574/better-escape.nvim",
    event = "InsertCharPre",
    config = function()
      require("better_escape").setup({
        default_mappings = false,
        mappings = {
          i = {
            ["<"] = {
              ["<"] = function()
                vim.api.nvim_input("<esc>")
              end,
            }
          }
        }
      })
    end,
  },
  {
    "ggandor/leap.nvim",
    event = "InsertCharPre",
    init = function()
      require("leap").add_default_mappings()
    end
  },
  {
    "tpope/vim-repeat",
    event = "InsertCharPre",
  },
}
