return {
  {
    "jbyuki/one-small-step-for-vimkind",
    ft = "lua"
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    opts = {
      floating = {
        border = "rounded"
      },
      layouts = {
        {
          elements = { {
            id = "repl",
            size = 0.5
          }, {
            id = "console",
            size = 0.5
          } },
          position = "bottom",
          size = 10
        }
      }
    },
    config = function(_, opts)
      local dap = require("dap")
      local dapui = require("dapui")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        -- dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dapui.setup(opts)
    end
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/cmp-dap",
      "williamboman/mason.nvim",
      { "theHamsta/nvim-dap-virtual-text" },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "nvim-dap" },
        cmd = { "DapInstall", "DapUninstall" },
        opts = { handlers = {} },
      },
      "rcarriga/nvim-dap-ui",
    },
    cmd = {
      "DapExtensionsLoadAll",
      "DapExtensionsRunLast",
      "DapExtensionsQuit",
      "DapExtensionsQuitAll",
      "DapExtensionsEvaluate",
      "DapBreakpointsClear",
      "DapToggleBreakpoint",
      "DapShowLog",
    },
    config = function()
      local extensions = require("extensions.dap")

      local fn = require("utils.fn")
      local dap = require("dap")

      -- dap.run = fn.wrap(dap.run, function(run, config, opts)
      --   run(config, opts)
      -- end)
      dap.adapters = require("extensions.dap.adapters").load()
      dap.configurations = require('extensions.dap.configurations').load()

      vim.api.nvim_create_user_command('DapExtensionsEvaluate', extensions.evaluate, {})
      vim.api.nvim_create_user_command('DapExtensionsLoadAll', extensions.load_all, {})
      vim.api.nvim_create_user_command('DapExtensionsRunLast', extensions.run_last, {})

      vim.api.nvim_create_user_command('DapExtensionsQuit', extensions.quit, {})
      vim.api.nvim_create_user_command('DapExtensionsQuitAll', extensions.quit_all, {})

      vim.api.nvim_create_user_command('DapBreakpointsClear', function()
        dap.clear_breakpoints()
      end, {})
    end
  }
}
