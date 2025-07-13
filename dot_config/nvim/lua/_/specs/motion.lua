return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      modes = {
        char = {
          keys = { "f", "F", ";", "," },
        }
      }
    },
    -- stylua: ignore
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
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
    "tpope/vim-repeat",
    event = "InsertCharPre",
  },
}
