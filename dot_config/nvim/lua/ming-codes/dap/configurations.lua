local state = require('ming-codes.dap.state')

return {
  load_configurations = function()
    local absolutePath = vim.api.nvim_buf_get_name(0)
    local relativePath = vim.fn.expand('%')

    return {
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
        name = string.format("vitest run --no-threads %s", relativePath),
        type = "pwa-node",
        request = "launch",
        runtimeExecutable = "node",
        runtimeArgs = { "./node_modules/.bin/vitest", "run", "--no-threads", absolutePath },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
      {
        name = "vue-cli-service test:unit",
        type = "pwa-node",
        request = "launch",
        runtimeExecutable = "node",
        runtimeArgs = { "./node_modules/.bin/vue-cli-service", "test:unit" },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
      {
        name = string.format("vue-cli-service test:unit --runInBand %s", relativePath),
        type = "pwa-node",
        request = "launch",
        runtimeExecutable = "node",
        runtimeArgs = { "./node_modules/.bin/vue-cli-service", "test:unit", "--runInBand", absolutePath },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
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
        name = string.format("jest --runInBand %s", relativePath),
        type = "pwa-node",
        request = "launch",
        runtimeExecutable = "node",
        runtimeArgs = { "./node_modules/.bin/jest", "--runInBand", absolutePath },
        rootPath = "${workspaceFolder}",
        cwd = "${workspaceFolder}",
        console = "integratedTerminal",
        internalConsoleOptions = "neverOpen",
      },
      {
        name = "cypress (WIP)"
      }
    }
  end
}
