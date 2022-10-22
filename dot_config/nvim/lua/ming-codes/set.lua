
vim.g['airline#extensions#tabline#enabled']                 = 1
vim.g['airline#extensions#tabline#show_buffers']            = 0
-- vim.g['airline#extensions#tabline#show_tabs']            = 0
vim.g['airline#extensions#tabline#show_tab_type']           = 0
vim.g['airline#extensions#tabline#show_close_button']       = 0
-- vim.g['airline#extensions#tabline#tabs_label']           = 0 -- use this for MODE?

vim.g['airline#extensions#tabline#tab_nr_type']             = 1
vim.g['airline#extensions#tabline#show_tab_count']          = 0
-- vim.g['airline#extensions#tabline#excludes'] = { 'spec' } -- use this to exclude right side
vim.g['airline#extensions#tabline#excludes']                = { '.' } -- use this to exclude right side
vim.g['airline#extensions#tabline#exclude_preview']         = 1


vim.g['airline#parts#ffenc#skip_expected_string']           = 'utf-8[unix]'
vim.g['airline_inactive_collapse']                          = 1
vim.g['airline_powerline_fonts']                            = 1
vim.g['airline_statusline_ontop']                           = 0
vim.g['airline_skip_empty_sections']  = 0
--vim.g['airline_disable_statusline']                         = 1
vim.g['airline_section_tab_right']                                  = ""
vim.g['airline_section_a']                                  = ""
vim.g['airline_section_b']                                  = ""
--vim.g['airline_section_c']                                  = ""
vim.g['airline_section_x']                                  = "" -- filetype
vim.g['airline_section_y']                                  = ""
vim.g['airline_section_z']                                  = "" -- line number
vim.g['airline_section_[...]']                              = "" -- others
vim.g['airline_theme']                                      = 'papercolor'
vim.g['tmuxline_preset']                                    = 'minimal'
vim.g['gh_line_map']                                        = 'gh'
-- vim.g['gh_line_map_default']                                = 0
-- vim.g['gh_line_blame_map_default']                          = 0

-- "let g:netrw_localrmdir                                   = 'trash'
-- "let g:netrw_rm_cmd                                       = 'trash'
-- "let g:netrw_rmf_cmd                                      = 'trash'
-- "let g:netrw_rmdir_cmd                                    = 'trash'
-- "let g:netrw_sizestyle                                    = 'h'
-- 
-- "let g:vim_json_conceal=0
-- "let g:markdown_syntax_conceal=0

vim.g['coc_global_extensions'] = {
	'coc-tsserver',
	'coc-css',
	'coc-json',
	'coc-html',
	'coc-vimlsp',
	'coc-highlight',
	'coc-ember',
	'coc-tailwindcss'
}

vim.g['undotree_SplitWidth']                       = 35

vim.g['mapleader'] = " "


vim.o.clipboard = 'unnamed,unnamedplus'

vim.o.ignorecase = true;
vim.o.smartcase = true;

vim.o.cursorline = true
vim.o.hlsearch = true
vim.o.cmdheight = 0
vim.o.laststatus = 1
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.mouse = a
vim.o.autoindent = true
vim.o.wrap = false
vim.o.encoding = 'utf-8'

vim.o.splitbelow = true
vim.o.splitright = true

-- Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
-- delays and poor user experience
vim.o.updatetime = 300

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved

vim.o.signcolumn = 'yes'

vim.o.ruler = true
vim.o.number = true
vim.o.relativenumber = true

vim.o.startofline = true

-- vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"

vim.o.undofile = true
vim.o.backup = true

-- string.format("%s/nvim-swap", os.getenv('TMPDIR'))
vim.o.directory = os.getenv('TMPDIR') .. '/nvim-swap//'
vim.o.undodir = os.getenv('TMPDIR') .. '/nvim-undo//'
vim.o.backupdir = os.getenv('TMPDIR') .. '/nvim-backup//'

vim.o.background = 'light'

vim.cmd.color('PaperColor')
vim.cmd('highlight VertSplit ctermfg=24 ctermbg=255')
