local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup({
    server_filetype_map = {
        typescript = 'typescript'
    },
    ui = {
        border = 'rounded',
    }
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[e', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']e', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<C-,>', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', '<C-.>', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('i', '<C-d>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'go', '<Cmd>Lspsaga outline<CR>', opts)
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)
vim.keymap.set('n', 'gR', '<Cmd>Lspsaga rename ++project<CR>', opts)
vim.keymap.set('n', 'gt', '<Cmd>Lspsaga term_toggle<CR>', opts)
