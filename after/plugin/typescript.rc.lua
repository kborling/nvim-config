local status, typescript = pcall(require, "typescript")
if (not status) then return end
typescript.setup({})

local opts = { noremap = true, silent = true, expr = false }

vim.keymap.set("n", "<leader>rn", "<Cmd>TypescriptRenameFile<CR>",
  opts)
