
nnoremap <silent> <bs> :TmuxNavigateLeft<cr>
nnoremap K :UndotreeToggle<cr>
nnoremap S :OverCommandLine<cr>
nnoremap Y v$hy

" vim-easy-align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <F3> :noh<CR>

inoremap << <ESC>
nnoremap <C-p> :FZF -m<cr>

vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

nnoremap W <Leader><Leader>w
nnoremap E <Leader><Leader>e
nnoremap B <Leader><Leader>b

" Autocomplete
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <C-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .  '<C-x><C-o><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
inoremap <expr> <S-Space> (pumvisible() ? (col('.') > 1 ? '<Esc>i<Right>' : '<Esc>i') : '') .  '<C-x><C-u><C-r>=pumvisible() ? "\<lt>C-n>\<lt>C-p>\<lt>Down>" : ""<CR>'
