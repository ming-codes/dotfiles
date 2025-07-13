local tmpdir = os.getenv("TMPDIR")

vim.o.clipboard = 'unnamed,unnamedplus'
vim.o.termguicolors = true

vim.o.showtabline = 2

vim.o.pumwidth = 25
vim.o.pumheight = 10

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.cmdheight = 2
vim.o.laststatus = 2
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.mouse = ''
vim.o.autoindent = true
vim.o.wrap = false
vim.o.encoding = 'utf-8'

vim.o.splitbelow = true
vim.o.splitright = true

vim.o.updatetime = 300

vim.o.signcolumn = 'yes'

vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.ruler = true
vim.o.number = true
vim.o.relativenumber = true

vim.o.startofline = true

vim.o.undofile = true
vim.o.backup = true

vim.o.background = 'light'

vim.o.directory = string.format('%s/nvim/swap/', tmpdir)
vim.o.undodir = string.format('%s/nvim/undo//', tmpdir)
vim.o.backupdir = string.format('%s/nvim/backup//', tmpdir)
