function load_adapters()
  require("dap").adapters = require("extensions.dap.adapters").load()
end

function load_configurations()
  require("dap").configurations = require('extensions.dap.configurations').load()
end

function maybe_terminate_session()
  local dap = require("dap")

  if (dap.session() ~= nil)
  then
    dap.terminate(nil, nil, function()
      dap.close()
    end)
  end
end

function maybe_run_last()
  local dap = require("dap")
  local config = require("extensions.dap.state").get_last_config()

  if (config ~= nil)
  then
    dap.run_last()
  else
    load_adapters()
    load_configurations()

    vim.cmd("Telescope dap configurations")
  end
end

return {
  load_all = function()
    load_adapters()
    load_configurations()
  end,
  run_last = function()
    maybe_terminate_session()
    maybe_run_last()
  end,
  evaluate = function()
    require("dapui").eval()
  end,

  -- TODO  we're looking to restart
  quit = function()
    local dap = require("dap")

    -- dap.close()
    -- dap.disconnect()
    -- dap.terminate()

    dap.terminate(nil, nil, function()
      dap.close()
    end)
  end,
  quit_all = function()
    local dap = require("dap")
    local dapui = require("dapui")

    local cb

    cb = function()
      if (dap.session() ~= nil) then
        dap.terminate(nil, nil, cb)
      else
        dapui.close()
      end
    end

    cb()
  end
}

-- When we launch, we actually spawn 2 new processes: the app or debugee and the debug adapter
--
-- `run_last` does a terminate first, then run
--
-- `disconnect` kills the debug adapter, with option to kill the app
-- `close` just cleans up the state on the client side
-- `terminate` is just a smart disconnect
--
-- ideally, we're looking to kill the app, then have the debug adapter attach to new


-- disconnect(opts, cb)                                          *dap.disconnect()*
--
--         disconnect asks the debug adapter to disconnect from the debuggee and
--         to terminate the debug adapter.
--
--         The client session may remain open if the debug adapter does not
--         terminate. To ensure the session gets closed, also call |dap.close()|.
--
--         Requires an active session.
--
--         Parameters: ~
--             {opts}    Table with options for the disconnect request.
--                       Defaults to `{ restart = false, terminateDebuggee = null }`
--
--             {cb}      Callback that is invoked once the session
--                       disconnected or immediately if no session is active.
--
--
-- close()                                                            *dap.close()*
--         Closes the current session.
--
--         This does NOT terminate the debug adapter or debugee.
--         You usually want to use either |dap.terminate()| or |dap.disconnect()|
--         instead.
--
-- terminate(terminate_opts, disconnect_opts, cb),                                           *dap.terminate()*
--         Terminates the debug session.
--
--         If the debug adapter doesn't support the `terminateRequest`
--         capability, this will instead call |dap.disconnect()| with
--         `terminateDebugee = true`.
--
--         Parameters: ~
--             {terminate_opts}      Options for the `terminate` request.
--                                   Defaults to empty.
--                                   Not used if |dap.disconnect| is used.
--
--             {disconnect_opts}     Opts for |dap.disconnect|
--                                   Defaults to `{ terminateDebuggee = true }`
--
--             {cb}                  Callback that is invoked once the session
--                                   terminated or immediately if no session is
--                                   active.
--
