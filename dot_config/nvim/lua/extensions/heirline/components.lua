return {
  git_branch = function()
    return {
      provider = function()
        return vim.fn.FugitiveHead()
      end
    }
  end,
  vpn_state = function()
    -- vpn state | grep -Eoi '(dis)?connected' | uniq

    return {
    }
  end
}
