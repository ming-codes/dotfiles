return {
  load = function()
    local absolutePath = vim.api.nvim_buf_get_name(0)
    local relativePath = vim.fn.fnamemodify(vim.fn.expand("%"), ":~:.")

    return {
      javascript = {
        {
          name = "Next.js: debug server-side",
          type = "pwa-node",
          request = "launch",
          runtimeExecutable = "node",
          runtimeArgs = { "./node_modules/.bin/next", "dev" },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        {
          name = "Next.js: debug client-side",
          type = "chrome",
          request = "launch",
          url = "http://localhost:3000"
        },
        {
          name = "Next.js: debug full stack",
          type = "node-terminal",
          request = "launch",
          command = "npm run dev",
          serverReadyAction = {
            pattern = "- Local:.+(https?://.+)",
            uriFormat = "%s",
            action = "debugWithChrome"
          }
        },
        {
          name = "jest",
          type = "pwa-node",
          request = "launch",
          runtimeExecutable = "npx",
          runtimeArgs = { "jest", "test:unit" },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        {
          name = string.format("jest --runInBand %s", relativePath),
          type = "pwa-node",
          request = "launch",
          runtimeExecutable = "npx",
          runtimeArgs = { "jest", "--runInBand", absolutePath },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        {
          name = "vitest run",
          type = "pwa-node",
          request = "launch",
          runtimeExecutable = "npx",
          runtimeArgs = { "vitest", "run" },
          rootPath = "${workspaceFolder}",
          cwd = "${workspaceFolder}",
          console = "integratedTerminal",
          internalConsoleOptions = "neverOpen",
        },
        {
          name = string.format("vitest run --pool=forks --no-watch %s", relativePath),
          type = "pwa-node",
          request = "launch",
          runtimeExecutable = "npx",
          runtimeArgs = { "vitest", "--pool=forks", "--no-watch", absolutePath },
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
