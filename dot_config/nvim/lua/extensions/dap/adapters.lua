return {
  load = function()
    local registry = require("mason-registry")
    local home = vim.fn.expand("~")
    -- registry.get_package("js-debug-adapter"):get_install_path()
    return {
      ["pwa-node"] = {
        type = "server",
        host = "localhost",
        port = "${port}",
        executable = {
          -- command = "js-debug-adapter", -- As I'm using mason, this will be in the path
          -- TODO  need to look up mason path for ^
          -- require("./js-debug/src/dapDebugServer");
          -- :lua print(require("mason-registry").get_package("js-debug-adapter"):get_install_path())
          -- nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js
          -- commaond = "node" -- we probably want a fixed version of node
          -- args { "dapDebugServer", "${port}" }
          command = "node",
          args = {
            home .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
            "${port}"
          },
        }
      },

      nlua = function(callback, config)
        callback({ type = 'server', host = config.host or "127.0.0.1", port = config.port or 8086 })
      end

    }
  end
}
