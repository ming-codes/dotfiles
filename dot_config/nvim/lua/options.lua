local tmpdir = os.getenv("TMPDIR")

return {
  g = {
    mapleader = " ",
    symbol_indent = "▏",
    symbol_arrow_left = "",
    symbol_arrow_right = "",
    goyo_width = 120,
    skip_ts_context_commentstring_module = true,
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
    wrap = false,
    encoding = 'utf-8',

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
  wo = {
    foldcolumn = 1,
  }
}
