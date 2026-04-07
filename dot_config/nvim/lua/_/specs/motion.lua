return {
  {
    "tpope/vim-repeat",
    event = "InsertCharPre",
  },
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
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    dependencies = {
      "nvimtools/hydra.nvim",
    },
    keys = {
      { "<leader>w", desc = "Control Window Hydra" },

      { "<A-h>",     "<cmd>lua require('smart-splits').resize_left()<cr>",       desc = "Resize window left" },
      { "<A-j>",     "<cmd>lua require('smart-splits').resize_down()<cr>",       desc = "Resize window down" },
      { "<A-k>",     "<cmd>lua require('smart-splits').resize_up()<cr>",         desc = "Resize window up" },
      { "<A-l>",     "<cmd>lua require('smart-splits').resize_right()<cr>",      desc = "Resize window down" },
      -- moving between splits
      { "<C-h>",     "<cmd>lua require('smart-splits').move_cursor_left()<cr>",  desc = "Move to window left" },
      { "<C-j>",     "<cmd>lua require('smart-splits').move_cursor_down()<cr>",  desc = "Move to window below" },
      { "<C-k>",     "<cmd>lua require('smart-splits').move_cursor_up()<cr>",    desc = "Move to window above" },
      { "<C-l>",     "<cmd>lua require('smart-splits').move_cursor_right()<cr>", desc = "Move to window right" },
      -- swapping buffers between windows
      { "<C-w>h",    "<cmd>lua require('smart-splits').swap_buf_left()<cr>",     desc = "Swap window with left" },
      { "<C-w>j",    "<cmd>lua require('smart-splits').swap_buf_down()<cr>",     desc = "Swap window with down" },
      { "<C-w>k",    "<cmd>lua require('smart-splits').swap_buf_up()<cr>",       desc = "Swap window with up" },
      { "<C-w>l",    "<cmd>lua require('smart-splits').swap_buf_right()<cr>",    desc = "Swap window with right" },
    },
    opts = {
      -- Enable tmux integration for seamless navigation between Neovim and tmux panes
      multiplexer_integration = 'tmux',
    },
    config = function(plugin, opts)
      local hydra = require("hydra")
      local ss = require('smart-splits');

      ss.setup(opts)

      hydra({
        name = "Control Window Hydra",
        mode = "n",
        body = "<leader>w",
        -- hint = [[
        --      ^ ^Step^ ^ ^      ^ ^     Action
        --  ----^-^-^-^--^-^----  ^-^-------------------
        --      ^ ^back^ ^ ^     ^_t_: toggle breakpoint
        --      ^ ^ _K_^ ^        _T_: clear breakpoints
        --  out _H_ ^ ^ _L_ into  _c_: continue
        --      ^ ^ _J_ ^ ^       _u_: terminate
        --      ^ ^over ^ ^     ^^_r_: open repl
        --                        _]_: move tab right
        --                        _[_: move tab left
        --
        --      ^ ^  _q_: exit
        -- ]],
        config = {
          color = 'blue',
          invoke_on_body = true,
          hint = {
            type = 'window'
          },
        },
        heads = {
          { "h", function() ss.resize_left(10) end,  { desc = "Resize window left (10)", exit = false } },
          { "H", function() ss.resize_left(1) end,   { desc = "Resize window left (1)", exit = false } },
          { "j", function() ss.resize_down() end,    { desc = "Resize window down", exit = false } },
          { "k", function() ss.resize_up() end,      { desc = "Resize window up", exit = false } },
          { "l", function() ss.resize_right(10) end, { desc = "Resize window down", exit = false } },
          { "L", function() ss.resize_right(1) end,  { desc = "Resize window down", exit = false } },
          { "]", "<cmd>tabm +1<cr>",                 { desc = "Move tab right", exit = false } },
          { "[", "<cmd>tabm -1<cr>",                 { desc = "Move tab left", exit = false } },
          { 'q', nil,                                { exit = true, nowait = true, desc = 'exit' } },
        }
      })
    end,
  },
}
