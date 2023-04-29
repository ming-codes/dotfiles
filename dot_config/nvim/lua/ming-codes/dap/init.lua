
local state = require('ming-codes.dap.state')
local config = require('ming-codes.dap.configurations')

local dap = require("dap")
local dapui = require("dapui")
local js = require("dap-vscode-js")
local vt = require("nvim-dap-virtual-text")


js.setup({
  -- node_path = "node", -- Path of node executable. Defaults to $NODE_PATH, and then "node"
  -- debugger_path = "(runtimedir)/site/pack/packer/opt/vscode-js-debug", -- Path to vscode-js-debug installation.
  debugger_path = os.getenv("HOME") .. "/.local/share/vscode-js-debug", -- Path to vscode-js-debug installation.

  -- debugger_cmd = { "js-debug-adapter" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
  adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
  -- log_file_path = "(stdpath cache)/dap_vscode_js.log" -- Path for file logging
  -- log_file_level = false -- Logging level for output to file. Set to false to disable file logging.
  -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
})

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Use this to override mappings for specific elements
  element_mappings = {
    -- Example:
    -- stacks = {
    --   open = "<CR>",
    --   expand = "o",
    -- }
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7") == 1,
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks"
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  controls = {
    -- Requires Neovim nightly (or 0.8 when released)
    enabled = true,
    -- Display controls in this element
    element = "repl",
    icons = {
      pause = "",
      play = "",
      step_into = "",
      step_over = "",
      step_out = "",
      step_back = "",
      run_last = "↻",
      terminate = "□",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

vt.setup()

vim.api.nvim_create_user_command('DapContinueToCursor', dap.run_to_cursor, {
  nargs = 0
})

function launch_options(configurations)
  local choices = vim.tbl_map(function(config)
    configurations[config.name] = config

    return config.name
  end, configurations)

  dap.terminate(nil, nil, function()
    vim.ui.select(choices, {}, function(choice)
      print(choices[choice])

      dapui.open()
      dap.run(configurations[choice])
    end)
  end)
end

-- TODO if paused, resume, else restart
function step_resume_or_restart()
  if (state.has_paused_thread()) then
    dap.continue()
  elseif (state.get_last_config()) then
    dap.run_last()
  else
    launch_options(config.load_configurations())
  end
end

return {
  step_over = dap.step_over,
  step_into = dap.step_into,
  step_out = dap.step_out,
  resume_smart = step_resume_or_restart,
  launch_last = function()
    local session = dap.session()

    if (session) then
      dap.terminate(nil, nill, function()
        dap.close()
        dap.run_last()
      end)
    else
      dap.run_last()
    end
  end,
  quit = function()
    dapui.close()
    dap.terminate(nil, nil, function()
      dap.close()
    end)
  end
}
