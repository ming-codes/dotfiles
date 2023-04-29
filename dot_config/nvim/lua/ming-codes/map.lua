
-- [
--   keymap semantics
--   % -- current file
--   . -- repeat
--   g -- goto
--   y -- yank
--   <leader> -- external
-- ]

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

-- TODO vmap / to search things under v
-- "nnoremap [ :cprev<cr>
-- "nnoremap ] :cnext<cr>

-- vim.keymap.set('n', '<leader>gr', '<Cmd>);
