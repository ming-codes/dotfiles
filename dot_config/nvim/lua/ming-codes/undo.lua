vim.api.nvim_create_user_command('UndotreeCustom', function(cmd)
  local bufname = unpack(cmd.fargs)

  vim.cmd('leftabove vertical ' .. vim.g.undotree_SplitWidth .. ' new ' .. bufname)
end, {
  nargs = 1
})
