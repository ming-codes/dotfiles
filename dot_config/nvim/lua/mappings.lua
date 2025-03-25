--
-- TODO: use this format
-- { "lhs", "rhs", "desc", mode = "n", ft = {}, event = "" }
-- groupby mode, if multiple modes, duplicate
-- ft register to filetype autocmd on pattern
-- event support specific few LspAttach
--

function map(list)
  -- groupBy event or ft
  require("utils.table").groupBy(list, function(item)
    return item.mode or "n"
  end)
end

--
-- Mapping Pattern
-- <leader> -- global menu or contextual action to the current buffer
-- <leader><leader> -- contextual action to the current cursor position
--
-- y -- Yank
-- % -- current file
--

return {
  {
    { "<leader>f", desc = "󰍉 Find (grep)" },
    { "<leader>f?", "<cmd>Telescope builtin<cr>", desc = "Find Telescope builtins" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "File" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffer" },
    { "<leader>ft", "<cmd>TodoTelescope<cr>", desc = "TODO lists" },
    { "<leader>fw", "<cmd>Telescope live_grep<cr>", desc = "Word" },
    { "<leader>fW", "<cmd>Telescope live_grep_args live_grep_args<cr>", desc = "Word with args" },
    { "<leader>fs", "<cmd>Telescope git_status<cr>", desc = "Git status" },
    { "<leader>fg", "<cmd>Telescope my git_diff ref=origin<cr>", desc = "Git diff origin" },
    { "<leader>fG", "<cmd>Telescope my git_diff<cr>", desc = "Git diff" },
    -- git diff, but filter by content?
    -- git rev-parse --abbrev-ref origin/HEAD
    -- ["<leader>fh"] = { "", "Help" },

    { "<leader><leader>f", desc = "󰍉 Find (grep)" },
    { "<leader><leader>ff", "<cmd>Telescope my find_files<cr>", desc = "File" },
    { "<leader><leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Word under cursor" },
    -- {"<leader><leader>fh", "<cmd>h <cr>", "Help" },  TODO search <cword> in :h

    { "<leader>p", desc = "󰏖 Packages" },
    { "<leader>pm", "<cmd>Mason<cr>", desc = "Mason" },
    { "<leader>pl", "<cmd>Lazy<cr>", desc = "Lazy" },

    { "<leader>l", desc = " LSP" },
    { "<leader>lr", "<cmd>LspRestart<cr>", desc = "Restart" },
    -- ["<leader>lf"] = { " LSP" }, -- TODO lsp code format
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP information" }, -- TODO this shouldnt be needed
    { "<leader>lf", "<cmd>LspZeroFormat<cr>", desc = "LSP Format" },

    { "<leader>u", desc = " UI" },
    -- toggle signcolumn	Leader + ug
    -- ["<leader>uu"] = { "<cmd>UndotreeToggle<cr>", "Toggle Undotree" },
    { "<leader>ut", "<cmd>Neotest summary<cr>", desc = "Toggle Neotest summary" },
    -- ["<leader>uf"] = { "<cmd>Goyo<cr>", "Toggle focus mode (Goyo)" },
    -- ["<leader>ug"] = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle Gitsigns" },
    -- ["<leader>uc"] = { "<cmd>ColorizerToggle<cr>", "Toggle Colorizer" },
    -- ["<leader>ux"] = { "<cmd>TroubleToggle document_diagnostics<cr>", "Document Diagnostics (Trouble)" },
    -- ["<leader>uX"] = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Workspace Diagnostics (Trouble)" },
    -- ["<leader>uh"] = { "<cmd>require('oil').toggle_hidden()<cr>", "Toggle hidden (Oil)" },
    -- ["<leader>ud"] = { "<cmd>diffthis<cr>", "diffthis" },
    -- ["<leader>uD"] = { "<cmd>diffoff<cr>", "diffoff" },
    -- ["<leader>ub"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle DAP UI" },
    -- ["<leader>uL"] = { "<cmd>TroubleToggle loclist<cr>", "Location List (Trouble)" },
    -- ["<leader>uQ"] = { "<cmd>TroubleToggle quickfix<cr>", "Quickfix List (Trouble)" },

    { "<leader>b", desc = "󰓩 Buffers" },
    -- ["<leader>bb"] = { "󰓩 Buffers" }, -- picker
    { "<leader>bd", "<cmd>bd<cr>", desc = "Delete" },   -- picker
    { "<leader>bD", "<cmd>bd!<cr>", desc = "Delete!" }, -- picker
    { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Pick" },

    { "<leader>d", desc = " Debugger" },
    { "<leader>dd", "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", desc = "Debug last test" },
    { "<leader>dD", "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", desc = "Debug nearest test" },

    { "<leader>du", "<cmd>lua require('dapui').toggle()<cr>", desc = "Toggle DAP UI" },
    { "<leader>dq", "<cmd>DapExtensionsQuit<cr>", desc = "Terminate session" },
    { "<leader>dQ", "<cmd>DapExtensionsQuitAll<cr>", desc = "Terminate session and close" },
    { "<leader>de", "<cmd>DapExtensionsEvaluate<cr>", desc = "Evaluate expression" },
    { "<leader>dE", "<cmd>lua require('dapui').float_element('repl', { ['width'] = 180, ['height'] = 40, ['position'] ='center' })<cr>", desc = "REPL as float" },
    { "<leader>dt", "<cmd>lua require('dapui').float_element('console', { ['width'] = 180, ['height'] = 40, ['position'] ='center' })<cr>", desc = "Console as float" },
    -- ["<leader>dB"] = { "<cmd>DapBreakpointsClear<cr>", "Clear all breakpoints" },
    -- ["<leader>dE"] = { "<cmd>DapExtensionsEvaluate<cr>", "Evaluate expression" }, TODO copy expression to floating console
    { "<leader>dl", "<cmd>DapShowLog<cr>", desc = "DAP Log" },
    { "<leader>dv", "<cmd>DapVirtualTextToggle<cr>", desc = "Toggle variable virtual text" },

    -- ["<leader><leader>d"] = { " Debugger" },

    { "<leader>r", desc = " Run" },
    { "<leader>rT", "<cmd>lua require('neotest').run.run(vim.fn.getcwd())<cr>", desc = "Neotest run all tests" },
    -- ["<leader>dd"] = { "<cmd>DapExtensionsRunLast<cr>", "Run last" },
    { "<leader>rR", "<cmd>DapExtensionsLoadAll<cr><cmd>Telescope dap configurations<cr>", desc = "Run" },

    -- Plan:
    -- dd Neotest debug last -- smart function that need to figure out what was ran last
    -- dt Neotest debug nearest test
    -- dT Neotest debug all test

    -- ["<leader><leader>r"] = { " Run" },
    -- ["<leader><leader>rr"] = { "<cmd>Neotest run<cr>", "Neotest run nearest test" },
    -- ["<leader><leader>rR"] = { "<cmd>lua require('neotest').run.run({ strategy = 'dap' })<cr>", "Neotest debug nearest test" },

    { "<leader>g", desc = "󰊢 Git" },
    { "<leader>gg", "<cmd>lua require('extensions.toggleterm').toggle_persist('lazygit')<cr>", desc = "Launch LazyGit" }, -- TODO use toggle term to persist it, astronvim have example
    { "<leader>gb", "<cmd>Git blame<CR>", desc = "Blame file" },
    { "<leader>gl", "<cmd>Git log<CR>", desc = "Log file" },
    { "<leader>gh", "<cmd>Octo pr search<cr>", desc = "Search Pull Requests" },

    { "<leader>h", desc = " GitHub" },
    { "<leader>hh", "<cmd>Octo pr search<cr>", desc = "Search Pull Request" },
    { "<leader>hc", "<cmd>Octo pr create<cr>", desc = "Create Pull Request" },

    { "<leader><leader>g", desc = "󰊢 Git" },
    { "<leader><leader>gb", "<cmd>lua require('gitsigns').blame_line { full = true }<cr>", desc = "Blame line" },
    -- ["<leader>gp"] = { "<cmd>lua require('gitsigns').preview_hunk()<cr>", "Preview Git hunk" },
    -- ["<leader>gh"] = { "<cmd>lua require('gitsigns').reset_hunk()<cr>", "Reset Git hunk" },
    -- ["<leader>gr"] = { "<cmd>lua require('gitsigns').reset_buffer()<cr>", "Reset Git buffer" },
    -- ["<leader>gs"] = { "<cmd>lua require('gitsigns').stage_hunk()<cr>", "Stage Git hunk" },
    -- ["<leader>gS"] = { "<cmd>lua require('gitsigns').stage_buffer()<cr>", "Stage Git buffer" },
    -- ["<leader>gu"] = { "<cmd>lua require('gitsigns').undo_stage_hunk()<cr>", "Unstage Git hunk" },
    -- ["<leader>gd"] = { "<cmd>lua require('gitsigns').diffthis()<cr>", "View Git diff" },
    -- ["<leader>gl"] = { "<cmd>lua require('gitsigns').blame_line()<cr>", "View Git blame" },

    { "<leader>s", desc = "󱂬 Session" },
    { "<leader>ss", "<cmd>SessionManager save_current_session<cr>", desc = "Save current session" },
    { "<leader>sl", "<cmd>SessionManager load_current_dir_session<cr>", desc = "Load current directory session" },
    { "<leader>sL", "<cmd>SessionManager load_session<cr>", desc = "Load session" },

    -- ["<leader>ss"] = { "<cmd>SessionManager load_last_session<cr>", "" },

    { "<leader>t", desc = " Terminal" },
    { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating terminal" },
    -- ["<leader>tk"] = { "", "" }, kill ** TODO

    { "<leader><leader>l", desc = " LSP" },
    { "<leader><leader>la", "<cmd>Lspsaga code_action<CR>", desc = "LSP code action" },
    { "<leader><leader>lr", "<cmd>Lspsaga rename<CR>", desc = "LSP rename" },
    { "<leader><leader>lR", "<cmd>Lspsaga rename ++project<CR>", desc = "LSP rename in project" },

    { "<leader>y", desc = " Yank" },
    { "<leader>yp", "<cmd>let @* = fnamemodify(expand('%'), ':~:.')<cr>", desc = "Path of current file" },
    -- FIXME  ^ doesnt work for Oil or Netrw buffers
    { "<leader>yP", "<cmd>let @* = expand('%:p')<cr>", desc = "Absolute path of current file" },
    { "<leader>yf", "<cmd>echo 'Not implemented'<cr>", desc = "Name of current file" },
    { "<leader>yF", "<cmd>echo 'Not implemented'<cr>", desc = "Name of current file with extension" },
    { "<leader>yh", "<cmd>GBrowse!<cr>", desc = "Github path of current file" }, -- TODO  yank github path of current file
    -- https://github.com/tpope/vim-fugitive/issues/1053

    { "<leader><leader>y", desc = " Yank" },
    { "<leader><leader>yh", "<cmd>GBrowse!<cr>", desc = "Github path of current line" }, -- TODO  yank github path of current file
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



    { "<leader>x", desc = " External" },
    { "<leader>xh", "<cmd>GBrowse<cr>", desc = "Open current file in Github" },
    {
      "<leader>xx",
      "<cmd>lua require('open').open(require('extensions.fs').get_buffer_abspath())<cr>",
      desc = "Open current file with default application"
    },

    { "<leader><leader>x", desc = " External" },
    { "<leader><leader>xh", "<cmd>GBrowse<cr>", desc = "Open current line in Github" },
    -- https://github.com/tpope/vim-fugitive/issues/1053
    {
      "<leader><leader>xx",
      "<cmd>lua require('open').open(require('extensions.fs').get_line_abspath())<cr>",
      desc = "Open current file with default application"
    },

    { "g", desc = "Jump" },
    { "gJ", "<cmd>Telescope jumplist<cr>", desc = "Telescope Jump List" },
    { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to definitions" },
    { "gj", "<cmd>lua require('dap').down()<cr>", desc = "Go down frame stack" },
    { "gk", "<cmd>lua require('dap').up()<cr>", desc = "Go up frame stack" },
    { "gD", "<cmd>Telescope dap frames<cr>", desc = "Go to frame" },
    { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
    { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
    { "go", "<cmd>Telescope lsp_type_definitions", desc = "Go to type definitions" },
    { "gb", "<cmd>Telescope dap list_breakpoints<cr>", desc = "Go to breakpoints" },
    -- :Telescope dap commands
    -- :Telescope dap variables
    -- :Telescope dap frames

    { "]g", "<cmd>lua require('gitsigns').next_hunk()<cr>", desc = "Next Git hunk" },
    { "[g", "<cmd>lua require('gitsigns').prev_hunk()<cr>", desc = "Previous Git hunk" },

    { "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Previous diagnostic" },
    { "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next diagnostic" },

    { "]t", "<cmd>lua require('todo-comments').jump_next()<cr>", desc = "Next todo comment" },
    { "[t", "<cmd>lua require('todo-comments').jump_prev()<cr>", desc = "Previous todo comment" },

    { "[q", "<cmd>TroublePrevious<cr>", desc = "Previous trouble/quickfix item" },
    { "]q", "<cmd>TroubleNext<cr>", desc = "Next trouble/quickfix item" },

    { "-", "<cmd>Oil<cr>", desc = "Open parent directory" },
    { "t", "<cmd>DapToggleBreakpoint<cr>", desc = "Absolute path of current file" }, -- TODO remap this to something better
    { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover doc" },
    { "KK", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },

    -- [""] = { "<cmd>Lspsaga code_action<cr>", "Code action" }
    -- ["gr"] = { "<cmd>Lspsaga rename<cr>", "Rename" }

    -- FIXME  arrow should map telescope history search
    -- These keys interfere with dap repl
    { "<Up>", "<cmd>DapContinue<cr>", desc = "Continue" },
    { "<Down>", "<cmd>DapStepOver<cr>", desc = "Step over" },
    { "<Right>", "<cmd>DapStepInto<cr>", desc = "Step into" },
    { "<Left>", "<cmd>DapStepOut<cr>", desc = "Step out" },

    -- ["<C-v"] = { "", "" }, -- TODO open line in new split
    -- ["<C-t"] = { "", "" }, -- TODO open line in new tab

    { "<leader><leader>f", desc = "󰍉 Find (grep)", mode = "v" },
    { "<leader><leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Word", mode = "v" },
    { "<leader><leader>fW", "<cmd>Telescope grep_visual_selection<cr>", desc = "Word with args", mode = "v" },
    -- ["/"] = { "<Plug>(comment_toggle_linewise)", "Toggle comment" },
    --  K('n', cfg.opleader.line, '', { desc = 'Comment toggle linewise' })
    --      K('n', cfg.opleader.block, '<Plug>(comment_toggle_blockwise)', { desc = 'Comment toggle blockwise' })

    --      K('n', cfg.toggler.line, function()
    --          return vvar('count') == 0 and '<Plug>(comment_toggle_linewise_current)'
    --              or '<Plug>(comment_toggle_linewise_count)'
    --      end, { expr = true, desc = 'Comment toggle current line' })
    --      K('n', cfg.toggler.block, function()
    --          return vvar('count') == 0 and '<Plug>(comment_toggle_blockwise_current)'
    --              or '<Plug>(comment_toggle_blockwise_count)'
    --      end, { expr = true, desc = 'Comment toggle current block' })

    --      -- VISUAL mode mappings
    --      K(
    --          'x',
    --          cfg.opleader.line,
    --          '<Plug>(comment_toggle_linewise_visual)',
    --          { desc = 'Comment toggle linewise (visual)' }
    --      )
    --      K(
    --          'x',
    --          cfg.opleader.block,
    --          '<Plug>(comment_toggle_blockwise_visual)',
    --          { desc = 'Comment toggle blockwise (visual)' }
    --      )
    { "<leader>x", desc = " External", mode = "v" },
    { "<leader>xh", "<cmd>GBrowse<cr>", desc = "Open current file in Github", mode = "v" },

    { "<leader><leader>de", "<cmd>DapExtensionsEvaluate<cr>", desc = "Evaluate expression", mode = "v" },
    -- ["<leader><leader>de"] = { "<cmd>DapExtensionsEvaluate<cr>", "Evaluate expression" },
    -- ["<leader><leader>dE"] = { "<cmd>DapExtensionsEvaluate<cr>", "Evaluate expression" }, TODO copy expression to floating console
  },
}
--       ["<leader>ld"] = {
--         function() vim.diagnostic.open_float() end,
--         desc = "Hover diagnostics",
--       },
--       ["gl"] = {
--         function() vim.diagnostic.open_float() end,
--         desc = "Hover diagnostics",
--       },
--     keys = {
--       -- { "<leader>fw", "<cmd>Telescope grep_string<cr>", desc = "Find word (grep)" },
--      ["bs = { desc = "󰒺 Sort Buffers" },
--
--       { "<leader>fd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Find diagnostics" },
--       { "<leader>fD", "<cmd>Telescope diagnostics<cr>", desc = "Find diagnostics in workspace" },
--
--       { "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Go to
--       definition" },
--       -- gD: Jumps to the declaration of the symbol under the cursor. Some servers don't implement this feature. See :help vim.lsp.buf.declaration().
--       -- { "gD", "<cmd>Telescope lsp_", desc = "" },
--       { "gi", "<cmd>Telescope lsp_implementations<cr>", desc = "Go to implementations" },
--       { "go", "<cmd>Telescope lsp_type_definitions", desc = "Go to type definitions" },
--       { "gr", "<cmd>Telescope lsp_references<cr>", desc = "Go to references" },
--       -- gs: Displays signature information about the symbol under the cursor in a floating window. See :help vim.lsp.buf.signature_help(). If a mapping already exists for this key this function is not bound.
--       -- { "gs", "<cmd>Telescope lsp_", desc = "" },
--
--       --
--       -- { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
--       -- { "<leader>/", Util.telescope("live_grep"), desc = "Grep (root dir)" },
--       -- { "<leader>:", "<cmd>Telescope command_history<cr>", desc = "Command History" },
--       -- { "<leader><space>", Util.telescope("files"), desc = "Find Files (root dir)" },
--       -- -- find
--       -- { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
--       -- { "<leader>fR", Util.telescope("oldfiles", { cwd = vim.loop.cwd() }), desc = "Recent (cwd)" },
--       -- -- git
--       -- { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
--       -- { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
--       -- -- search
--       -- { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
--       -- { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
--       -- { "<leader>sc", "<cmd>Telescope command_history<cr>", desc = "Command History" },
--       -- { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
--       -- { "<leader>sd", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document diagnostics" },
--       -- { "<leader>sD", "<cmd>Telescope diagnostics<cr>", desc = "Workspace diagnostics" },
--       -- { "<leader>sg", Util.telescope("live_grep"), desc = "Grep (root dir)" },
--       -- { "<leader>sG", Util.telescope("live_grep", { cwd = false }), desc = "Grep (cwd)" },
--       -- { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Help Pages" },
--       -- { "<leader>sH", "<cmd>Telescope highlights<cr>", desc = "Search Highlight Groups" },
--       -- { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
--       -- { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
--       -- { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
--       -- { "<leader>so", "<cmd>Telescope vim_options<cr>", desc = "Options" },
--       -- { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
--       -- { "<leader>sw", Util.telescope("grep_string"), desc = "Word (root dir)" },
--       -- { "<leader>sW", Util.telescope("grep_string", { cwd = false }), desc = "Word (cwd)" },
--       -- { "<leader>uC", Util.telescope("colorscheme", { enable_preview = true }), desc = "Colorscheme with preview" },
--       -- {
--       --   "<leader>ss",
--       --   Util.telescope("lsp_document_symbols", {
--       --     symbols = {
--       --       "Class",
--       --       "Function",
--       --       "Method",
--       --       "Constructor",
--       --       "Interface",
--       --       "Module",
--       --       "Struct",
--       --       "Trait",
--       --       "Field",
--       --       "Property",
--       --     },
--       --   }),
--       --   desc = "Goto Symbol",
--       -- },
--       -- {
--       --   "<leader>sS",
--       --   Util.telescope("lsp_dynamic_workspace_symbols", {
--       --     symbols = {
--       --       "Class",
--       --       "Function",
--       --       "Method",
--       --       "Constructor",
--       --       "Interface",
--       --       "Module",
--       --       "Struct",
--       --       "Trait",
--       --       "Field",
--       --       "Property",
--       --     },
--       --   }),
--       --   desc = "Goto Symbol (Workspace)",
--       -- },
--     },
