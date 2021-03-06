
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-abolish'

Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/vim-emoji'

Plug 'terryma/vim-expand-region'
Plug 'terryma/vim-multiple-cursors'

Plug 'sodapopcan/vim-twiggy'
Plug 'vim-syntastic/syntastic'
Plug 'mbbill/undotree'
Plug 'mileszs/ack.vim'
Plug 'osyo-manga/vim-over'
Plug 'triglav/vim-visual-increment'
Plug 'myusuf3/numbers.vim'
Plug 'editorconfig/editorconfig-vim'

"Plug 'simeji/winresizer'
Plug 'melonmanchan/vim-tmux-resizer'
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/Tabmerge'

" Style
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim' ", { 'do': ':TmuxlineSnapshot ~/.dotfiles/shell/tmuxline.sh' }
Plug 'edkolev/promptline.vim'
Plug 'NLKNguyen/papercolor-theme'

Plug 'Yggdroot/indentLine'

Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

"""
" Completion
"""

Plug 'neoclide/coc.nvim', {'branch': 'release'}

""
" Syntax
""

Plug 'sheerun/vim-polyglot'

" JavaScript
"Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
"Plug 'flowtype/vim-flow', { 'for': 'javascript' }
"Plug 'mtscout6/syntastic-local-eslint.vim', { 'for': 'javascript' }
" TypeScript
"Plug 'leafgarland/typescript-vim'
"leafgarland/typescript-vim
" Mustache
"Plug 'mustache/vim-mustache-handlebars'
" Less CSS
"Plug 'groenewege/vim-less'
" Elixir
"Plug 'elixir-lang/vim-elixir'
" PEG
Plug 'alunny/pegjs-vim'
" GLSL
"Plug 'tikhomirov/vim-glsl'
" Solidity
"Plug 'tomlion/vim-solidity'

call plug#end()
