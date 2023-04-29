
"" [
""   keymap semantics
""   % -- current file
""   . -- repeat
""   g -- goto
""   y -- yank
""   c -- code or syntax based action
""   <Space> -- external
"" ]

inoremap <silent> << <ESC>

""
"" yank
""
nnoremap <silent> y%         <Cmd>let @* = expand('%')<CR>
nnoremap <silent> y%%        <Cmd>let @* = expand('%:p')<CR>

""
"" nvim-dap
""
" TODO DapBreakpointCondition                                                                                                 -- <M-?> | Step Out
" nnoremap <leader>d -- debug smart, if session exist
" nnoremap <leader>D -- force debug options
nnoremap <silent> <Space>d  <Cmd>DapLaunchOptions<CR>
nnoremap <silent> <Space>d. <Cmd>lua require('ming-codes.dap').launch_last()<CR>
nnoremap <silent> <Space>dq <Cmd>lua require('ming-codes.dap').quit()<CR>
nnoremap <silent> <Space>dg <Cmd>DapContinueToCursor<CR>

nnoremap <silent> <Up>       <Cmd>lua require('ming-codes.dap').resume_smart()<CR>
nnoremap <silent> <Down>     <Cmd>lua require('ming-codes.dap').step_over()<CR>
nnoremap <silent> <Right>    <Cmd>lua require('ming-codes.dap').step_into()<CR>
nnoremap <silent> <Left>     <Cmd>lua require('ming-codes.dap').step_out()<CR>

nnoremap <silent> t          <Cmd>DapToggleBreakpoint<CR>

""
"" coc
""
" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
"inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let b:coc_suggest_disable = 0

" Use <c-space> to trigger completion
"if has('nvim')
"  inoremap <silent><expr> <c-space> coc#refresh()
"else
"  inoremap <silent><expr> <c-@> coc#refresh()
"endif

" Use `[` and `]` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [ <Plug>(coc-diagnostic-prev)
nmap <silent> ] <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" vmap inside/around function/class
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges
" Requires 'textDocument/selectionRange' support of language server
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Remap keys for applying code actions at the cursor position
nmap c  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap c%  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap cc  <Plug>(coc-fix-current)

" Symbol renaming
nmap cr <Plug>(coc-rename)

" Formatting selected code
"xmap f  <Plug>(coc-format-selected)

""
"" git
""
nnoremap <silent> <Space>g   <Cmd>LazyGit<CR>
nnoremap <silent> <Space>gb  <Cmd>Git blame<CR>

""
"" motion
""
lua require('leap').add_default_mappings()

""
"" undotree
""
nnoremap <silent> <Space>u <Cmd>UndotreeShow<CR>

""
"" fzf
""
nnoremap <silent> <C-p> <Cmd>FzfLua files<CR>
