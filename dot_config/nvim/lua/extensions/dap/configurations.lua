return {
  load = function()
    return {
      javascript = {
        {
          name = "jest",
          type = "pwa-node",
          request = "launch",
          runtimeExecutable = "node",
          runtimeArgs = { "./node_modules/.bin/jest", "test:unit" },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        {
          name = "jest --runInBand ${relativeFile}",
          type = "pwa-node",
          request = "launch",
          runtimeExecutable = "node",
          runtimeArgs = { "./node_modules/.bin/jest", "--runInBand", "${relativeFile}" },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        {
          name = "vitest run",
          type = "pwa-node",
          request = "launch",
          runtimeExecutable = "node",
          runtimeArgs = { "./node_modules/.bin/vitest", "run" },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        {
          name = "vitest run --no-threads ${relativeFile}",
          type = "pwa-node",
          request = "launch",
          runtimeExecutable = "node",
          runtimeArgs = { "./node_modules/.bin/vitest", "run", "--no-threads", "${relativeFile}" },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
      },

      lua = {
        {
          type = 'nlua',
          request = 'attach',
          name = "Attach to running Neovim instance",
        },
      }
    }
  end
}
-- for _, language in ipairs { "typescript", "javascript" } do
--     dap.configurations[language] = {
--         {
--             type = "pwa-node",
--             request = "launch",
--             name = "[node] Launch file",
--             program = "${file}",
--             cwd = "${workspaceFolder}",
--         },
--         {
--             type = "pwa-node",
--             request = "attach",
--             name = "[node] Attach",
--             processId = require("dap.utils").pick_process,
--             cwd = "${workspaceFolder}",
--         },
--         {
--             type = "pwa-node",
--             request = "launch",
--             name = "Debug Jest Tests",
--             -- trace = true, -- include debugger info
--             runtimeExecutable = "node",
--             runtimeArgs = {
--                 "./node_modules/jest/bin/jest.js",
--                 "--runInBand",
--             },
--             rootPath = "${workspaceFolder}",
--             cwd = "${workspaceFolder}",
--             console = "integratedTerminal",
--             internalConsoleOptions = "neverOpen",
--         },
--     }
-- end
--
-- 
-- dap.configurations.rust = {
--     {
--         name = "Attach",
--         type = "rt_lldb",
--         request = "attach",
--         pid = require("dap.utils").pick_process,
--         stopOnEntry = true,
--         waitFor = false,
--     },
-- }
