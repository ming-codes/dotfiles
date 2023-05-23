return {
  {
    "rcarriga/nvim-dap-ui",
    opts = {
      floating = {
        border = "rounded"
      }
    },
    config = function(plugin, opts)
      local dap = require("dap")
      local dapui = require("dapui")

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dapui.setup(opts)
    end
  },
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy", -- TODO use keys instead
    dependencies = {
      { "theHamsta/nvim-dap-virtual-text" },
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "nvim-dap" },
        cmd = { "DapInstall", "DapUninstall" },
        opts = { handlers = {} },
      },
      "rcarriga/nvim-dap-ui",
    },
    keys = function()
      local extensions = require("extensions.dap")

      return {
        { "<leader>dq", extensions.quit, desc = "Terminate debugger session" },
        { "<leader>dQ", extensions.quit_all, desc = "Terminate debugger session and close UI" },
        { "t", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
        { "<Down>", "<cmd>DapStepOver<cr>", desc = "Step over" },
        { "<Right>", "<cmd>DapStepInto<cr>", desc = "Step into" },
        { "<Left>", "<cmd>DapStepOut<cr>", desc = "Step out" },
      }
    end,
    config = function()
      vim.fn.sign_define("DapBreakpoint", {
        text = vim.g.icon_dap_breakpoint,
        texthl = "DapBreakpoint",
        linehl = "",
        numhl = ""
      })
      vim.fn.sign_define("DapBreakpointCondition", {
        text = vim.g.icon_dap_breakpoint_condition,
        texthl = "DapBreakpointCondition",
        linehl = "",
        numhl = ""
      })
      vim.fn.sign_define("DapLogPoint", {
        text = vim.g.icon_dap_log_point,
        texthl = "DapLogPoint",
        linehl = "",
        numhl = ""
      })
      vim.fn.sign_define("DapStopped", {
        text = vim.g.icon_dap_stopped,
        texthl = "DapStopped",
        linehl = "",
        numhl = ""
      })
      vim.fn.sign_define("DapBreakpointRejected", {
        text = vim.g.icon_dap_breakpoint_rejected,
        texthl = "DapBreakpointRejected",
        linehl = "",
        numhl = ""
      })
    end
  }
}
