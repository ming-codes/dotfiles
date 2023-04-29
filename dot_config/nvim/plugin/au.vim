
" TODO refactor this to lua
function! s:NetrwDelete() abort
  let dirname = expand('%')
  let filename = getline('.')
  let cmd = printf("%s %s/%s", "trash", dirname, filename)

  echo cmd
  call system(cmd)
  e .
endfunction

autocmd! FileType netrw nnoremap <buffer> D <Cmd>call <sid>NetrwDelete()<CR>
