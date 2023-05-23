local mason = require("mason-registry")
local table = require("utils.table")

local vue = "vue-language-server"
local debug = "js-debug-adapter"

table.each({ vue, debug }, function(module)
  if (not mason.is_installed(module)) then
    vim.cmd("MasonInstall " .. module)
  end
end)
