return {
  setup = function()
    local namespace = vim.api.nvim_create_namespace

    vim.on_key(function(char)
      if vim.fn.mode() == "n" then
        local new_hlsearch = vim.tbl_contains({ "<CR>", "n", "N", "*", "#", "?", "/" }, vim.fn.keytrans(char))
        if vim.opt.hlsearch:get() ~= new_hlsearch then
          vim.opt.hlsearch = new_hlsearch
        end
      end
    end, namespace "auto_hlsearch")
  end
}
