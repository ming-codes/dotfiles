
-- [
--   keymap semantics
--   % -- current file
--   . -- repeat
--   g -- goto
--   y -- yank
--   <leader> -- external
-- ]

-- y% copy file name to @" register
vim.keymap.set('n', 'y%', '<Cmd>let @* = expand("%")<cr>', {
  silent = true,
  noremap = true
})
vim.keymap.set('n', 'y%%', '<Cmd>let @* = expand("%:p")<cr>', {
  silent = true,
  noremap = true
})
vim.keymap.set('n', 'yg', function()
  -- TODO nmap yg -- yank github file
  local save = vim.g['gh_open_command']

  vim.g['gh_open_command'] = 'fn() { echo "$@" | pbcopy; }; fn '

  vim.cmd('execute "normal \\<Plug>(gh-line)"')

  vim.g['gh_open_command'] = save
end, {
  silent = true,
  noremap = true
})
vim.keymap.set('v', 'yg', function()
  -- TODO vmap yg -- yank github line
end, {
  silent = true,
  noremap = true
})

--
-- nvim-dap
--
-- nnoremap <leader>d -- debug smart
vim.cmd('nnoremap <leader>d <Cmd>DapLaunchOptions<CR>')
vim.cmd('nnoremap <leader>d. <Cmd>DapLaunchLast<CR>')
vim.cmd('nnoremap <leader>dq <Cmd>DapTerminate<CR><Cmd>DapUiClose<CR>')
vim.cmd('nnoremap <leader>dc <Cmd>DapContinue<CR>')
vim.cmd('nnoremap <leader>dg <Cmd>DapContinueToCursor<CR>')

vim.cmd('nnoremap <Up> <Cmd>DapResume<CR>')
vim.cmd('nnoremap <Down> <Cmd>DapStepOver<CR>')
vim.cmd('nnoremap <Right> <Cmd>DapStepInto<CR>')
vim.cmd('nnoremap <Left> <Cmd>DapStepOut<CR>')

-- DapBreakpointCondition                                                                                                 -- <M-?> | Step Out
vim.keymap.set('n', 't', '<Cmd>DapToggleBreakpoint<CR>', { -- t | Toggle Breakpoint
    silent = true
})

-- "nnoremap <silent> <Leader>dr <Cmd>lua require'dap'.repl.open()<CR>
-- "nnoremap <silent> <Leader>dl <Cmd>lua require'dap'.run_last()<CR>
-- 
vim.keymap.set('i', '<<', '<ESC>', {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<C-p>', '<Cmd>FzfLua files<cr>', {
  silent = true,
  noremap = true
})
vim.keymap.set('v', '<C-p>', function()
  local fzf = require('fzf-lua')
  local utils = require('fzf-lua.utils')

  fzf.files({
    fzf_opts = {
      ["--query"] = utils.get_visual_selection()
    }
  })
end, {
  silent = true,
  noremap = true
})
vim.keymap.set('n', '<M-p>', '<Cmd>FzfLua grep_project<cr>', {
  silent = true,
  noremap = true
})
vim.keymap.set('n', 'g<M-p>', '<Cmd>FzfLua grep<cr>', {
  silent = true,
  noremap = true
})
vim.keymap.set('v', '<M-p>', '<Cmd>FzfLua grep_visual<cr>', {
  silent = true,
  noremap = true
})

vim.keymap.set('n', '<leader>g', '<Cmd>LazyGit<cr>', {
  silent = true,
  noremap = true
})
vim.keymap.set('n', '<leader>gb', '<Cmd>Git blame<cr>', {
  silent = true,
  noremap = true
})

-- TODO vmap / to search things under v
-- "nnoremap [ :cprev<cr>
-- "nnoremap ] :cnext<cr>

require('leap').add_default_mappings()

-- vim.keymap.set('n', '<leader>gr', '<Cmd>);
