local status, saga = pcall(require, "lspsaga")
if (not status) then return end

saga.setup {
  server_filetype_map = {
    typescript = 'typescript'
  },
  ui = {
    border = 'rounded',
  }
}

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '[e', '<Cmd>Lspsaga diagnostic_jump_prev<CR>', opts)
vim.keymap.set('n', ']e', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<leader>o', '<Cmd>Lspsaga outline<CR>', opts)
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gh', '<Cmd>Lspsaga lsp_finder<CR>', opts)
--vim.keymap.set('n', 'gd', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gd', '<Cmd>Lspsaga goto_definition<CR>', opts)
vim.keymap.set('n', 'ga', '<Cmd>Lspsaga code_action<CR>', opts)
vim.keymap.set('i', '<C-k>', '<Cmd>Lspsaga signature_help<CR>', opts)
vim.keymap.set('n', 'gp', '<Cmd>Lspsaga preview_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<Cmd>Lspsaga rename<CR>', opts)


local Group = require('colorbuddy').Group
local colors = require('colorbuddy').colors

Group.new('TitleString', colors.noir_2, nil)
Group.new('TitleIcon', colors.noir_2, nil)
Group.new('SagaBorder', colors.noir_7, nil)
Group.new('SagaBeacon', colors.primary, nil)

Group.new('FinderType', colors.secondary, nil)
Group.new('FinderSelection', colors.primary, nil)
Group.new('FinderIcon', colors.secondary, nil)
