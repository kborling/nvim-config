local status, saga = pcall(require, "lspsaga")
if (not status) then return end

local colorbuddy_status, colorbuddy = pcall(require, "colorbuddy")
if (not colorbuddy_status) then return end

local Group = colorbuddy.Group
local colors = colorbuddy.colors

saga.setup({
  server_filetype_map = {
    typescript = 'typescript'
  },
  ui = {
    border = 'rounded',
    -- colors = {
    --   normal_bg = colors.background
    --   -- title_bg = colors.background,
    --   -- black = colors.background
    -- }
  }
})

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
vim.keymap.set('n', 'gt', '<Cmd>Lspsaga term_toggle<CR>', opts)

-- See https://github.com/glepnir/lspsaga.nvim/blob/main/lua/lspsaga/highlight.lua
-- for the group names
-- {
--   background = "background",
--   diagnostic_error = "#ff0038",
--   diagnostic_hint = "#47eae0",
--   diagnostic_info = "#47eae0",
--   diagnostic_warning = "#ff7700",
--   diff_add = "#00ff77",
--   diff_change = "#47eae0",
--   diff_delete = "#ff0038",
--   gray0 = "#111111",
--   gray1 = "#282a2e",
--   gray2 = "#373b41",
--   gray3 = "#969896",
--   gray4 = "#b4b7b4",
--   gray5 = "#c5c8c6",
--   gray6 = "#e0e0e0",
--   gray7 = "#ffffff",
--   noir_0 = "#ffffff",
--   noir_1 = "#f5f5f5",
--   noir_2 = "#d5d5d5",
--   noir_3 = "#b4b4b4",
--   noir_4 = "#a7a7a7",
--   noir_5 = "#949494",
--   noir_6 = "#737373",
--   noir_7 = "#535353",
--   noir_8 = "#323232",
--   noir_9 = "#212121",
--   none = "none",
--   primary = "#ff0088",
--   secondary = "#d5d5d5"
-- }
-- general
Group.new('TitleString', colors.secondary, colors.gray0)
Group.new('TitleSymbol', colors.primary, colors.gray0)
Group.new('TitleIcon', colors.primary, colors.gray0)
Group.new('SagaBorder', colors.noir_7, colors.gray0)
-- Group.new('SagaBeacon', colors.primary, nil)
-- Group.new('SagaExpand', colors.diff_delete, nil)
-- Group.new('SagaCollapse', colors.diff_delete, nil)
-- finder
Group.new('FinderType', colors.secondary, nil)
Group.new('FinderSelection', colors.primary, nil)
Group.new('FinderIcon', colors.secondary, nil)
-- hover
Group.new('HoverNormal', colors.primary, colors.gray0)
-- rename
Group.new('RenameNormal', colors.primary, colors.gray0)
-- code action
Group.new('CodeActionText', colors.secondary, nil)
Group.new('CodeActionConceal', colors.diff_add, nil)
-- outline
Group.new('OutlineIndent', colors.noir_7, nil)
-- terminal
Group.new('TerminalNormal', colors.secondary, colors.gray0)
