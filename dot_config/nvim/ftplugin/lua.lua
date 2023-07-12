
local mason = require("mason-registry")
local table = require("utils.table")

local ls = "lua-language-server"

table.each({ ls }, function(module)
  if (not mason.is_installed(module)) then
    vim.cmd("MasonInstall " .. module)
  end
end)
