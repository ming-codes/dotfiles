
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#show_buffers   = 0
let g:airline#extensions#tabline#show_tabs      = 1
let g:airline#extensions#tabline#tab_nr_type    = 1
let g:airline_powerline_fonts                   = 1
let g:airline_theme                             = 'papercolor'
let g:tmuxline_preset                           = 'minimal'

let g:netrw_localrmdir                          = 'trash'
let g:netrw_rm_cmd                              = 'trash'
let g:netrw_rmf_cmd                             = 'trash'
let g:netrw_rmdir_cmd                           = 'trash'
let g:netrw_sizestyle                           = 'h'

let g:syntastic_always_populate_loc_list        = 1
let g:syntastic_auto_loc_list                   = 0
let g:syntastic_check_on_open                   = 1
let g:syntastic_check_on_wq                     = 0
let g:syntastic_javascript_checkers             = [ 'jshint', 'eslint' ]
let g:syntastic_javascript_jshint_exe           = '[ -f $(npm bin)/jshint ] && $(npm bin)/jshint || jshint'
let g:syntastic_javascript_eslint_exe           = '[ -f $(npm bin)/eslint ] && $(npm bin)/eslint || eslint'

let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-css',
  \ 'coc-json',
  \ 'coc-html',
  \ 'coc-vimlsp',
  \ 'coc-highlight',
  \ 'coc-ember',
  \ 'coc-tailwindcss'
\ ]

let g:undotree_SplitWidth                       = 35

set list lcs=trail:·,tab:¦\ ,eol:¬
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,__pycache__,.git,.svn

set clipboard+=unnamedplus

set ignorecase
set smartcase

set magic
set cursorline
set wildmenu
set hlsearch
set cmdheight=2
set laststatus=2
set expandtab
set softtabstop=2
set tabstop=2
set shiftwidth=2
set mouse=a
set autoindent
set nowrap

set splitbelow
set splitright

set ruler
set number
set relativenumber

set conceallevel=0

set nostartofline

set directory=~/.config/nvim/vim-swap//

set undodir=~/.config/nvim/vim-undo//
set undofile

set backupdir=~/.config/nvim/vim-backup//
set backup

set omnifunc=syntaxcomplete#Complete
