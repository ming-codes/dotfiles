local fun = require('plenary.fun')
local dap = require('dap')

dap.run = fun.create_wrapper(dap.run)(function(...)
  return ...
end)
