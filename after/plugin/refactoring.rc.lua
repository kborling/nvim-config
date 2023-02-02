local status, refactoring = pcall(require, "refactoring")
if (not status) then return end
refactoring.setup({})

-- local opts = { noremap = true, silent = true, expr = false }
-- vim.keymap.set('n', '<leader>ri', "<Cmd>lua require('refactoring').refactor('Inline Variable')<CR>", opts)
