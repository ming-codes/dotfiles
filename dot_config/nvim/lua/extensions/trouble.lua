local opts = { skip_groups = true, jump = true }

return {
  prev = function()
    local trouble = require("trouble")

    if trouble.is_open() then
      trouble.previous(opts)
    else
      vim.cmd.cprev()
    end
  end,
  next = function()
    local trouble = require("trouble")

    if trouble.is_open() then
      trouble.next(opts)
    else
      vim.cmd.cnext()
    end
  end,
}
