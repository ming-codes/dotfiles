
--
-- Adapted from coc.vim
--
-- Some servers have issues with backup files, see #649
-- set nobackup
-- set nowritebackup


-- Use tab for trigger completion with characters ahead and navigate
-- NOTE: There's always complete item selected by default, you may want to enable
-- no select by `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
-- other plugin before putting this into your config
vim.keymap.set('i', '<TAB>', 'coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\\<Tab>" : coc#refresh()', {
  silent = true,
  expr = true
})
vim.keymap.set('i', '<S-TAB>', 'coc#pum#visible() ? coc#pum#prev(1) : "\\<C-h>"', {
  silent = true,
  expr = true
})

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
vim.keymap.set('i', '<CR>', 'coc#pum#visible() ? coc#pum#confirm() : "\\<C-g>u\\<CR>\\<c-r>=coc#on_enter()\\<CR>"', {
  silent = true,
  expr = true
})

-- " Use <c-space> to trigger completion
vim.keymap.set('i', '<c-space>', 'coc#refresh()', { -- inoremap <silent><expr> <c-space> coc#refresh()
  silent = true,
  expr = true
})

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
vim.keymap.set('n', '[g', '<Plug>(coc-diagnostic-prev)', {
  silent = true,
  noremap = true
})
vim.keymap.set('n', ']g', '<Plug>(coc-diagnostic-next)', {
  silent = true,
  noremap = true
})

-- GoTo code navigation
vim.keymap.set('n', 'gd', '<Plug>(coc-definition)', {
  silent = true
})
vim.keymap.set('n', 'gy', '<Plug>(coc-type-definition)', {
  silent = true
})
vim.keymap.set('n', 'gi', '<Plug>(coc-implementation)', {
  silent = true
})
vim.keymap.set('n', 'gr', '<Plug>(coc-references)', {
  silent = true
})

-- Use K to show documentation in preview window
-- nnoremap <silent> K :call ShowDocumentation()<CR>
vim.keymap.set('n', 'K', function()
  if (vim.fn['CocAction']('hasProvider', 'hover')) then
    vim.fn['CocActionAsync']('doHover')
  else
    vim.fn['feedkeys']('K', 'in')
  end
end, {
  silent = true,
  noremap = true
})

-- Highlight the symbol and its references when holding the cursor
vim.cmd('autocmd CursorHold * silent call CocActionAsync(\'highlight\')')

-- Symbol renaming
vim.keymap.set('n', '<leader>rn', '<Plug>(coc-rename)')

-- Formatting selected code
vim.keymap.set('x', '<leader>f', '<Plug>(coc-format-selected)')
vim.keymap.set('n', '<leader>f', '<Plug>(coc-format-selected)')

-- augroup mygroup
--   autocmd!
--   " Setup formatexpr specified filetype(s)
--   autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
--   " Update signature help on jump placeholder
--   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
-- augroup end

-- Applying code actions to the selected code block
-- Example: `<leader>aap` for current paragraph
vim.keymap.set('x', '<leader>a', '<Plug>(coc-codeaction-selected)')
vim.keymap.set('n', '<leader>a', '<Plug>(coc-codeaction-selected)')

-- Remap keys for applying code actions at the cursor position
vim.keymap.set('n', '<leader>ac', '<Plug>(coc-codeaction-cursor)') -- nmap <leader>ac  <Plug>(coc-codeaction-cursor)
-- Remap keys for apply code actions affect whole buffer
vim.keymap.set('n', '<leader>as', '<Plug>(coc-codeaction-source)') -- nmap <leader>as  <Plug>(coc-codeaction-source)
-- Apply the most preferred quickfix action to fix diagnostic on the current line
vim.keymap.set('n', '<leader>qf', '<Plug>(coc-fix-current)') -- nmap <leader>qf  <Plug>(coc-fix-current)

-- Remap keys for applying refactor code actions
vim.keymap.set('n', '<leader>re', '<Plug>(coc-codeaction-refactor)', { -- nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
  silent = true
})
vim.keymap.set('x', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { -- xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
  silent = true
})
vim.keymap.set('n', '<leader>r', '<Plug>(coc-codeaction-refactor-selected)', { -- nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
  silent = true
})

-- Run the Code Lens action on the current line
vim.keymap.set('n', '<leader>cl', '<Plug>(coc-codelens-action)') -- :nmap <leader>cl  <Plug>(coc-codelens-action)

-- Map function and class text objects
-- NOTE: Requires 'textDocument.documentSymbol' support from the language server
vim.keymap.set('x', 'if', '<Plug>(coc-classobj-i)') -- :xmap if <Plug>(coc-classobj-i)
vim.keymap.set('o', 'if', '<Plug>(coc-classobj-i)') -- :xmap if <Plug>(coc-classobj-i)
vim.keymap.set('x', 'af', '<Plug>(coc-classobj-a)') -- :xmap af <Plug>(coc-classobj-a)
vim.keymap.set('o', 'af', '<Plug>(coc-classobj-a)') -- :xmap af <Plug>(coc-classobj-a)
vim.keymap.set('x', 'ic', '<Plug>(coc-classobj-i)') -- :xmap ic <Plug>(coc-classobj-i)
vim.keymap.set('o', 'ic', '<Plug>(coc-classobj-i)') -- :xmap ic <Plug>(coc-classobj-i)
vim.keymap.set('x', 'ac', '<Plug>(coc-classobj-a)') -- :xmap ac <Plug>(coc-classobj-a)
vim.keymap.set('o', 'ac', '<Plug>(coc-classobj-a)') -- :omap ac <Plug>(coc-classobj-a)

-- " Remap <C-f> and <C-b> to scroll float windows/popups
vim.keymap.set('n', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "\\<C-f>"', {
  silent = true,
  noremap = true,
  nowait = true,
  expr = true
})
vim.keymap.set('n', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "\\<C-b>"', {
  silent = true,
  noremap = true,
  nowait = true,
  expr = true
})
vim.keymap.set('i', '<C-f>', 'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(1)\\<cr>" : "\\<Right>"', {
  silent = true,
  noremap = true,
  nowait = true,
  expr = true
})
vim.keymap.set('i', '<C-b>', 'coc#float#has_scroll() ? "\\<c-r>=coc#float#scroll(0)\\<cr>" : "\\<Left>"', {
  silent = true,
  noremap = true,
  nowait = true,
  expr = true
})
vim.keymap.set('v', '<C-f>', 'coc#float#has_scroll() ? coc#float#scroll(1) : "\\<C-f>"', {
  silent = true,
  noremap = true,
  nowait = true,
  expr = true
})
vim.keymap.set('v', '<C-b>', 'coc#float#has_scroll() ? coc#float#scroll(0) : "\\<C-b>"', {
  silent = true,
  noremap = true,
  nowait = true,
  expr = true
})

-- Use CTRL-S for selections ranges
-- Requires 'textDocument/selectionRange' support of language server
vim.keymap.set('n', '<C-s>', '<Plug>(coc-range-select)', {
  silent = true
})
vim.keymap.set('x', '<C-s>', '<Plug>(coc-range-select)', {
  silent = true
})

-- Add `:Format` command to format current buffer
vim.cmd('command! -nargs=0 Format :call CocActionAsync(\'format\')')

-- Add `:Fold` command to fold current buffer
vim.cmd('command! -nargs=? Fold :call     CocAction(\'fold\', <f-args>)')

-- " Add `:OR` command for organize imports of the current buffer
vim.cmd('command! -nargs=0 OR   :call     CocActionAsync(\'runCommand\', \'editor.action.organizeImport\')')

-- Add (Neo)Vim's native statusline support
-- NOTE: Please see `:h coc-status` for integrations with external plugins that
-- provide custom statusline: lightline.vim, vim-airline
vim.cmd('set statusline^=%{coc#status()}%{get(b:,\'coc_current_function\',\'\')}')

-- Mappings for CoCList
-- Show all diagnostics
vim.keymap.set('n', '<space>a', '<Cmd><C-u>CocList diagnostics<cr>', {
  silent = true,
  noremap = true,
  nowait = true
})
-- Manage extensions
vim.keymap.set('n', '<space>e', '<Cmd><C-u>CocList extensions<cr>', {
  silent = true,
  noremap = true,
  nowait = true
})
-- Show commands
vim.keymap.set('n', '<space>c', '<Cmd><C-u>CocList commands<cr>', {
  silent = true,
  noremap = true,
  nowait = true
})
-- Find symbol of current document
vim.keymap.set('n', '<space>o', '<Cmd><C-u>CocList outline<cr>', {
  silent = true,
  noremap = true,
  nowait = true
})
-- Search workspace symbols
vim.keymap.set('n', '<space>s', '<Cmd><C-u>CocList -I symbols<cr>', {
  silent = true,
  nowait = true
})
-- Do default action for next item
vim.keymap.set('n', '<space>j', '<Cmd><C-u>CocNext<CR>', {
  silent = true,
  nowait = true
})
-- Do default action for previous item
vim.keymap.set('n', '<space>k', '<Cmd><C-u>CocPrev<CR>', {
  silent = true,
  nowait = true
})
-- Resume latest coc list
vim.keymap.set('n', '<space>p', '<Cmd><C-u>CocListResume<CR>', {
  silent = true,
  nowait = true
})
