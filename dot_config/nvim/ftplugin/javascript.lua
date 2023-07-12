-- TODO  ensure TreeSitter loads javascript
-- TODO  ensure Mason loads javascript
-- This file gets run everytime ft is set / buffer open
-- require("mason-registry").is_installed("typescript-language-server")
-- eslint-lsp
-- jdtls
-- js-debug-adapter
-- json-lsp

local mason = require("mason-registry")
local table = require("utils.table")

local debug = "js-debug-adapter"

table.each({ debug }, function(module)
  if (not mason.is_installed(module)) then
    vim.cmd("MasonInstall " .. module)
  end
end)
