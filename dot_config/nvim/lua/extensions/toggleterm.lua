local cache = {}

local function getTerminal(cmd)
  if (cache[cmd] ~= nil) then
    return cache[cmd]
  end

  local Terminal = require('toggleterm.terminal').Terminal
  local instance = Terminal:new({
    cmd = cmd,
    direction = "float",
    hidden = true,
  })

  cache[cmd]     = instance

  return instance
end

return {
  toggle_persist = function(cmd)
    getTerminal(cmd):toggle()
  end
}
