return {
  ["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
      command = "js-debug-adapter", -- As I'm using mason, this will be in the path
      args = { "${port}" },
    }
  }
}
