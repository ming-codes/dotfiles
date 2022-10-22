local M = {}

function M.setup(config)
end

require('ming-codes.set')
require('ming-codes.map')

require('ming-codes.coc')
require('ming-codes.ts')
require('ming-codes.dap')
require('ming-codes.undo')

return M
