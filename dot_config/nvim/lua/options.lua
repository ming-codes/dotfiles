local tmpdir = os.getenv("TMPDIR")

return {
  g = {
    mapleader = " ",
    symbol_indent = "▏",
    icon_diagnostic_error = "",
    icon_diagnostic_hint = "󰌵",
    icon_diagnostic_info = "󰋼",
    icon_diagnostic_warn = "",
    icon_dap_breakpoint = "",
    icon_dap_breakpoint_condition = "",
    icon_dap_breakpoint_rejected = "",
    icon_dap_log_point = ".>",
    icon_dap_stopped = "󰁕",
  },
  o = {
    clipboard = 'unnamed,unnamedplus',
    termguicolors = true,

    showtabline = 2,

    pumwidth = 25,
    pumheight = 10,

    ignorecase = true,
    smartcase = true,

    cursorline = true,
    hlsearch = true,
    cmdheight = 2,
    laststatus = 2,
    expandtab = true,
    softtabstop = 2,
    tabstop = 2,
    shiftwidth = 2,
    mouse = '',
    autoindent = true,
    wrap = 0,
    encoding ='utf-8',

    splitbelow = true,
    splitright = true,

    updatetime = 300,

    signcolumn = 'yes',

    timeout = true,
    timeoutlen = 300,

    ruler = true,
    number = true,
    relativenumber = true,

    startofline = true,

    undofile = true,
    backup = true,

    background = 'light',

    directory = string.format('%s/nvim/swap/', tmpdir),
    undodir = string.format('%s/nvim/undo//', tmpdir),
    backupdir = string.format('%s/nvim/backup//', tmpdir),
  },
}
