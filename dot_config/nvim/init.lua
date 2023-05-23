local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local options = require("options")
local mappings = require("mappings")

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

require("lazy").setup("plugins")
