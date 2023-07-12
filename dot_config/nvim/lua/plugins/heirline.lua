vim.cmd('hi TablineActiveArrow guifg=red guibg=blue')

return {
  "itchyny/lightline.vim",
  init = function()
    vim.g.lightline = {
      colorscheme = "PaperColor",
      separator = {
        left = "",
        right = "",
      },
      subseparator = {
        left = "\\ue0b1",
        right = "\\ue0b3",
      },
      -- component = { },
      -- component.coc                            = "%{coc#status()}%{get(b:,'coc_current_function','')}"
      component_function = {
        gitbranch = 'FugitiveHead'
      },
      active = {
        left = { { 'filename' } },
        right = {}
      },
      inactive = {
        left = { { 'filename' } },
        right = {}
      },
      tabline = {
        right = { { 'gitbranch' } }
      }
    }
  end,

  -- {
  --   "rebelot/heirline.nvim",
  --   event = "BufEnter",
  --   config = true,
  --   opts = function()
  --     local table = require("utils.table")
  --     local conditions = require("heirline.conditions")
  --     local utils = require("heirline.utils")

  --     local function enrich(buffers)
  --       local init = buffers.init

  --       buffers.init = function(self)
  --         init(self)

  --         _G.Bufs = table.i_map(self, function(item)
  --           return {
  --             is_active = item.is_active,
  --             is_visible = item.is_visible,
  --           }
  --         end)

  --         for i, child in ipairs(self) do
  --           child.prev = self[i - 1] or nil
  --           child.next = self[i + 1] or nil
  --         end
  --       end

  --       return buffers
  --     end

  --     local function get_color(node)
  --       if (node == nil) then
  --         return utils.get_highlight("TabLineFill")
  --       elseif (node.is_visible) then
  --         return utils.get_highlight("TabLineSel")
  --       else
  --         return utils.get_highlight("TabLine")
  --       end
  --     end

  --     return {
  --       -- statuscolumn = vim.fn.has "nvim-0.9" == 1 and {
  --       --    status.component.foldcolumn(),
  --       --    status.component.fill(),
  --       --    status.component.numbercolumn(),
  --       --    status.component.signcolumn(),
  --       -- } or nil,
  --       tabline = {
  --         enrich(utils.make_buflist({
  --           {
  --             provider = function(self)
  --               local bufname = vim.api.nvim_buf_get_name(self.bufnr)

  --               if (bufname == "") then
  --                 return "[No Name]"
  --               else
  --                 return vim.fs.basename(vim.api.nvim_buf_get_name(self.bufnr))
  --               end
  --             end,
  --             hl = function(self)
  --               return get_color(self)
  --             end
  --           },
  --           {
  --             -- provider = ''
  --             provider = function(self)
  --               local icons = require("powerline")

  --               if (self.next == nil) then
  --                 return icons.arrow_right
  --               elseif (self.prev == nil) then
  --                 return icons.chevron_right
  --               elseif (self.prev.is_visible == self.next.is_visible) then
  --                 return icons.chevron_right
  --               else
  --                 return icons.arrow_right
  --               end

  --               -- elseif (self.prev == nil) then
  --               --   return icons.arrow_right
  --               -- elseif (self.prev.is_visible == self.next.is_visible) then
  --               --   return icons.chevron_right
  --               -- elseif (self.prev.is_active == self.next.is_active) then
  --               --   return icons.chevron_right
  --               -- else
  --               --   return icons.arrow_right
  --               -- end
  --             end,
  --             hl = function(self)
  --               local left = get_color(self.prev)
  --               local right = get_color(self.next)

  --               if (self.next == nil) then
  --                 if (self.prev == nil) then
  --                   return ("TabLine")
  --                 elseif (self.prev.is_active) then
  --                   return ("TabLine")
  --                 elseif (self.prev.is_visible) then
  --                   return ("TabLine")
  --                 else
  --                   return ("TabLine")
  --                 end
  --               else
  --                 return "TabLine"
  --               end
  --               -- if (self.prev.is_active == self.next.is_active) then
  --               --   return "TabLineSel"
  --               -- else
  --               -- end
  --             end
  --           },
  --           -- {
  --           --   init = function(self, index)
  --           --     self.index = index
  --           --   end,
  --           --   provider = function(self)
  --           --     return vim.fs.basename(vim.api.nvim_buf_get_name(self.bufnr)) .. " " .. vim.g.symbol_arrow_right
  --           --   end,
  --           --   hl = function(self)
  --           --     if (self.is_active) then
  --           --       return "TabLineSel"
  --           --     elseif (self.is_visible) then
  --           --       return "TabLine"
  --           --     end
  --           --     return "Normal"
  --           --     -- exec 'hi BufTabLineCurrent' . s:fg_buftabline_current_fg . s:bg_buftabline_current_bg . s:ft_none
  --           --     -- exec 'hi BufTabLineActive' . s:fg_buftabline_active_fg . s:bg_buftabline_active_bg . s:ft_none
  --           --     -- exec 'hi BufTabLineHidden' . s:fg_buftabline_inactive_fg . s:bg_buftabline_inactive_bg . s:ft_none
  --           --     -- exec 'hi BufTabLineFill'  . s:bg_buftabline_bg . s:ft_none
  --           --   end
  --           -- }
  --         })),
  --       }
  --     }
  --   end
  -- }
}
-- return {
--   "rebelot/heirline.nvim",
--   event = "BufEnter",
--   opts = function()
--     local status = require "astronvim.utils.status"
--     return {
--       opts = {
--         disable_winbar_cb = function(args)
--           return status.condition.buffer_matches({
--             buftype = { "terminal", "prompt", "nofile", "help", "quickfix" },
--             filetype = { "NvimTree", "neo%-tree", "dashboard", "Outline", "aerial" },
--           }, args.buf)
--         end,
--       },
--       statusline = { -- statusline
--         hl = { fg = "fg", bg = "bg" },
--         status.component.mode(),
--         status.component.git_branch(),
--         status.component.file_info { filetype = {}, filename = false, file_modified = false },
--         status.component.git_diff(),
--         status.component.diagnostics(),
--         status.component.fill(),
--         status.component.cmd_info(),
--         status.component.fill(),
--         status.component.lsp(),
--         status.component.treesitter(),
--         status.component.nav(),
--         status.component.mode { surround = { separator = "right" } },
--       },
--       winbar = { -- winbar
--         init = function(self) self.bufnr = vim.api.nvim_get_current_buf() end,
--         fallthrough = false,
--         {
--           condition = function() return not status.condition.is_active() end,
--           status.component.separated_path(),
--           status.component.file_info {
--             file_icon = { hl = status.hl.file_icon "winbar", padding = { left = 0 } },
--             file_modified = false,
--             file_read_only = false,
--             hl = status.hl.get_attributes("winbarnc", true),
--             surround = false,
--             update = "BufEnter",
--           },
--         },
--         status.component.breadcrumbs { hl = status.hl.get_attributes("winbar", true) },
--       },
--       tabline = { -- bufferline
--         { -- file tree padding
--           condition = function(self)
--             self.winid = vim.api.nvim_tabpage_list_wins(0)[1]
--             return status.condition.buffer_matches(
--               { filetype = { "aerial", "dapui_.", "neo%-tree", "NvimTree" } },
--               vim.api.nvim_win_get_buf(self.winid)
--             )
--           end,
--           provider = function(self) return string.rep(" ", vim.api.nvim_win_get_width(self.winid) + 1) end,
--           hl = { bg = "tabline_bg" },
--         },
--         status.heirline.make_buflist(status.component.tabline_file_info()), -- component for each buffer tab
--         status.component.fill { hl = { bg = "tabline_bg" } }, -- fill the rest of the tabline with background color
--         { -- tab list
--           condition = function() return #vim.api.nvim_list_tabpages() >= 2 end, -- only show tabs if there are more than one
--           status.heirline.make_tablist { -- component for each tab
--             provider = status.provider.tabnr(),
--             hl = function(self) return status.hl.get_attributes(status.heirline.tab_type(self, "tab"), true) end,
--           },
--           { -- close button for current tab
--             provider = status.provider.close_button { kind = "TabClose", padding = { left = 1, right = 1 } },
--             hl = status.hl.get_attributes("tab_close", true),
--             on_click = {
--               callback = function() require("astronvim.utils.buffer").close_tab() end,
--               name = "heirline_tabline_close_tab_callback",
--             },
--           },
--         },
--       },
--       statuscolumn = vim.fn.has "nvim-0.9" == 1 and {
--         status.component.foldcolumn(),
--         status.component.fill(),
--         status.component.numbercolumn(),
--         status.component.signcolumn(),
--       } or nil,
--     }
--   end,
--   config = require "plugins.configs.heirline",
-- }
