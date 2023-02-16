local status, todo = pcall(require, "todo-comments")
if (not status) then return end

todo.setup({})

local opts = { noremap = true, silent = true, expr = false }

vim.keymap.set("n", ";t", "<Cmd>TodoTrouble<CR>", opts)
vim.keymap.set("n", ";T", "<Cmd>TodoTelescope<CR>", opts)
