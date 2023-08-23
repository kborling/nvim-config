local status, todo = pcall(require, "todo-comments")
if (not status) then return end

todo.setup({})

local opts = { noremap = true, silent = true, expr = false }

vim.keymap.set("n", "<leader>tc", "<Cmd>TodoTelescope<CR>", opts)
