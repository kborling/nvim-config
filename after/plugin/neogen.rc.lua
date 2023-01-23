local status, neogen = pcall(require, "neogen")
if (not status) then return end

neogen.setup({
  snippet_engine = "luasnip"
})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", ";c", ":lua require('neogen').generate()<CR>", opts)
