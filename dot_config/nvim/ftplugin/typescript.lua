-- TODO  ensure TreeSitter loads javascript
-- TODO  ensure Mason loads javascript
-- require("mason-registry").is_installed("typescript-language-server")
-- eslint-lsp
-- jdtls
-- js-debug-adapter
-- json-lsp
-- lua-language-server
-- vue-language-server
-- require("mason-registry").is_installed("")
--

local mason = require("mason-registry")
local table = require("utils.table")

local ts = "typescript-language-server"
local debug = "js-debug-adapter"

table.each({ ts, debug }, function(module)
  if (not mason.is_installed(module)) then
    vim.cmd("MasonInstall " .. module)
  end
end)
