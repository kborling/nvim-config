local status, refactoring = pcall(require, "refactoring")
if (not status) then return end
refactoring.setup({})

local opts = { noremap = true, silent = true, expr = false }

-- Remaps for the refactoring operations currently offered by the plugin
vim.keymap.set("v", "<leader>re", "<Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>",
  opts)
vim.keymap.set("v", "<leader>rf", "<Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>",
  opts)
vim.keymap.set("v", "<leader>rv", "<Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>",
  opts)
vim.keymap.set("v", "<leader>ri", "<Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>",
  opts)

-- Extract block doesn't need visual mode
vim.keymap.set("n", "<leader>rb", "<Cmd>lua require('refactoring').refactor('Extract Block')<CR>",
  opts)
vim.keymap.set("n", "<leader>rbf", "<Cmd>lua require('refactoring').refactor('Extract Block To File')<CR>",
  opts)
