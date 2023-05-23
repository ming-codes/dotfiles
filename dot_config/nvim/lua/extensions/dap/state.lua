local dap = require("dap")
local run = dap.run

local last_config = nil

dap.run = function(config, opt)
  last_config = config
  run(config, opt)
end

return {
  get_breakpoints = function()
    return require("dap.breakpoints").get()
  end,
  get_last_config = function()
    return last_config
  end,
  has_paused_thread = function()
    local session = dap.session()

    if (session) then
      for index, thread in pairs(session.threads) do
        if (thread.stopped) then
          return true;
        end
      end
    end

    return false
  end
}
