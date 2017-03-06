
source ~/.config/nvim/mappings.vim

source ~/.config/nvim/settings.vim

source ~/.config/nvim/plugins.vim

source ~/.config/nvim/appearance.vim

autocmd FileType javascript
      \ let b:syntastic_checkers =
      \ findfile('.eslintrc', '.;') != '' ? ['eslint'] :
      \ findfile('.jshintrc', '.;') != '' ? ['jshint'] :
      \ ['standard']
