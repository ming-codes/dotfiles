local palette = require('_.colors.palette')

for group, highlights in pairs(palette) do
  vim.api.nvim_set_hl(0, group, highlights)
end
