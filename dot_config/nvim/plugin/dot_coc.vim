
" Applying code actions to the selected code block
" Example: `<Space>aap` for current paragraph
xmap <Space>a  <Plug>(coc-codeaction-selected)
nmap <Space>a  <Plug>(coc-codeaction-selected)

" Run the Code Lens action on the current line
nmap <Space>cl  <Plug>(coc-codelens-action)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
