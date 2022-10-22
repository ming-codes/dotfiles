local dap = require("dap")
local ui = require("dap.ui")

local last_run_exist = false

local M = {}

-- [
--   Flow
--   Scan project to build launch config
-- ]

dap.listeners.after.event_initialized['ming-codes'] = function(session)
  last_run_exist = true
end

function scan_package_json()
  local file = vim.fs.find('package.json', {
    upward = true
  })

  print(unpack(file))
end

-- vim.api.nvim_create_user_command('Scan', scan_package_json, {
--   nargs = '?'
-- })

function first_run()
  local configurations = {
    {
      name = "node ./node_modules/.bin/vitest run --no-threads",
      type = "pwa-node",
      request = "launch",
      runtimeExecutable = "node",
      runtimeArgs = { "./node_modules/.bin/vitest", "run", "--no-threads" },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
      env = {
        NODE_OPTIONS = ""
      }
    }
    -- TODO scan package.json for relavent run modes: vitest, jest, etc
    -- TODO record run history and add it here
    -- local nopts = vim.deepcopy(opts) or {}
  }
  local function accessor(opts)
    return opts.name
  end
  local function callback(config)
    vim.ui.input({ prompt = "> " .. config.name .. " ", completion = "file" }, function(input)
      config.runtimeArgs = { unpack(config.runtimeArgs), input }

      print(unpack(config.runtimeArgs))

      dap.run(config)
    end)
  end

  ui.pick_one(configurations, "Debug using...", accessor, callback)
end

function launch_vitest(cmd)
  local config = {
    name = "node ./node_modules/.bin/vitest run --no-threads",
    type = "pwa-node",
    request = "launch",
    runtimeExecutable = "node",
    runtimeArgs = { "./node_modules/.bin/vitest", "run", "--no-threads" },
    rootPath = "${workspaceFolder}",
    cwd = "${workspaceFolder}",
    console = "integratedTerminal",
    internalConsoleOptions = "neverOpen",
    env = {
      NODE_OPTIONS = ""
    }
  }

  for key, value in ipairs(cmd.fargs) do
    if (value == '%') then
      config.runtimeArgs[#config.runtimeArgs + key] = vim.api.nvim_buf_get_name(0)
      config.name = config.name .. " " .. vim.api.nvim_buf_get_name(0)
    else
      config.runtimeArgs[#config.runtimeArgs + key] = value
      config.name = config.name .. " " .. value
    end
  end

  M.last_config = config

  print(unpack(config.runtimeArgs))
  dap.run(config)
end

function launch_options(cmd)
  local absolutePath = vim.api.nvim_buf_get_name(0)
  local relativePath = vim.fn.expand('%')
  local configurations = {
    {
      name = "vitest run",
      type = "pwa-node",
      request = "launch",
      runtimeExecutable = "node",
      runtimeArgs = { "./node_modules/.bin/vitest", "run" },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      name = string.format("vitest run --no-threads %s", relativePath),
      type = "pwa-node",
      request = "launch",
      runtimeExecutable = "node",
      runtimeArgs = { "./node_modules/.bin/vitest", "run", "--no-threads", absolutePath },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      name = "vue-cli-service test:unit",
      type = "pwa-node",
      request = "launch",
      runtimeExecutable = "node",
      runtimeArgs = { "./node_modules/.bin/vue-cli-service", "test:unit" },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      name = string.format("vue-cli-service test:unit --runInBand %s", relativePath),
      type = "pwa-node",
      request = "launch",
      runtimeExecutable = "node",
      runtimeArgs = { "./node_modules/.bin/vue-cli-service", "test:unit", "--runInBand", absolutePath },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      name = "jest",
      type = "pwa-node",
      request = "launch",
      runtimeExecutable = "node",
      runtimeArgs = { "./node_modules/.bin/jest", "test:unit" },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      name = string.format("jest --runInBand %s", relativePath),
      type = "pwa-node",
      request = "launch",
      runtimeExecutable = "node",
      runtimeArgs = { "./node_modules/.bin/jest", "--runInBand", absolutePath },
      rootPath = "${workspaceFolder}",
      cwd = "${workspaceFolder}",
      console = "integratedTerminal",
      internalConsoleOptions = "neverOpen",
    },
    {
      name = "cypress (WIP)"
    }
  }
  local choices = vim.tbl_map(function(config)
    configurations[config.name] = config

    return config.name
  end, configurations)

  vim.ui.select(choices, {}, function(choice)
    print(choices[choice])

    dap.run(configurations[choice])
  end)
end

function launch_last(cmd)
  local session = dap.session()

  if (session) then
    dap.terminate()
  end

  dap.run_last()
end

function step_resume(cmd)
  local session = dap.session()

  if (session) then
    dap.continue()
  end
end

vim.api.nvim_create_user_command('DapLaunchLast', launch_last, {
  nargs = 0
})

vim.api.nvim_create_user_command('DapLaunchOptions', launch_options, {
  nargs = 0
})

vim.api.nvim_create_user_command('DapResume', step_resume, {
  nargs = 0
})

-- lazy.ui.pick_if_many(
--     configurations,
--     "Configuration: ",
--     function(i) return i.name end,
--     function(configuration)
--       if configuration then
--         M.run(configuration, opts)
--       else
--         notify('No configuration selected', vim.log.levels.INFO)
--       end
--     end
--   )
