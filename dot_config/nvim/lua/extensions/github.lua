return {
  -- https://github.com/tpope/vim-fugitive/issues/1053
  -- :[range]GBrowse! [args] Like :GBrowse, but put the URL on the clipboard rather
  --                  than opening it.
  -- :'<,'>GBrowse master:%
  -- :'<,'>GBrowse master:%@mliu4-te
  -- 1. Use blame to find the commit,
  --    `systemlist("git -C ".. shellescape(expand('%:p:h')) .." log --no-merges -n 1 -L ".. line(".") ..":" .. shellescape(resolve(expand("%:t"))))[0]->split()[0]`
  -- 2. Find the remote/branch tracking branch that contains the commit
  --    `git branch --remote --sort=-committerdate --contains dbd0ded872e `
  -- 3. Use the remote to construct the fugitive object
  github_url = function(file)
    local uv = require("plenary.async").uv
    local esc = vim.fn.shellescape
    local ex = vim.fn.expand
    local res = vim.fn.resolve
    local line = vim.fn.line

    local template = "git -C %s --no-pager log --no-merges -n 1 -L %s:%s"
    local cmd = string.format(template, esc(ex("%:p:h")), line("."), esc(res(ex("%:t"))))

    print(vim.inspect(vim.fn.systemlist(cmd)[1]->split()))

    --    `systemlist("git -C ".. shellescape(expand('%:p:h')) .." log --no-merges -n 1 -L ".. line(".") ..":" .. shellescape(resolve(expand("%:t"))))[0]->split()[0]`

    -- local err, fd = a.uv.fs_open(path, "r", 438)
    -- assert(not err, err)

    -- local err, stat = a.uv.fs_fstat(fd)
    -- assert(not err, err)

    -- local err, data = a.uv.fs_read(fd, stat.size, 0)
    -- assert(not err, err)

    -- local err = a.uv.fs_close(fd)
    -- assert(not err, err)

    -- return data
  end,
}
