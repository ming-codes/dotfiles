local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local options = require("options")
local autocmd = require("autocmd")
local signs = require("signs")
local table = require("utils.table")

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

for key, value in pairs(options.g) do
  vim.g[key] = value
end

for key, value in pairs(options.o) do
  vim.o[key] = value
end

for _, config in ipairs(autocmd) do
  vim.api.nvim_create_autocmd(unpack(config))
end

for _, config in ipairs(signs) do
  local name = unpack(config)

  vim.fn.sign_define(name, {
    text = config.text,
    texthl = config.texthl,
    linehl = config.linehl,
    numhl = config.numhl,
  })
end

require("lazy").setup("plugins")

vim.cmd("highlight DiagnosticError guifg=#f50000 guibg=none")
vim.cmd("highlight DiagnosticSignError guifg=#f50000 guibg=none")

require("extensions.hlsearch").setup()
