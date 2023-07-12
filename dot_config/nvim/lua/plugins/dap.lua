return {
  {
    "jbyuki/one-small-step-for-vimkind",
    ft = "lua"
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    opts = {
      floating = {
        border = "rounded"
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
    cmd = { "DapQuit", "DapQuitAll", "DapRunLast", "DapToggleBreakpoint", "DapShowLog" },
    config = function()
      local extensions = require("extensions.dap")

      local fn = require("utils.fn")
      local dap = require("dap")

      -- dap.run = fn.wrap(dap.run, function(run, config, opts)
      --   run(config, opts)
      -- end)
      dap.adapters = require("extensions.dap.adapters").load()
      dap.configurations = require('extensions.dap.configurations').load()

      vim.api.nvim_create_user_command('DapQuit', extensions.quit, {})
      vim.api.nvim_create_user_command('DapQuitAll', extensions.quit_all, {})
      vim.api.nvim_create_user_command('DapRunLast', dap.run_last, {})
    end
  }
}
