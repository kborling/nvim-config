local status, tt = pcall(require, "toggleterm")
if (not status) then return end

tt.setup({
    open_mapping = [[<c-\>]],
    direction = 'float',
    shade_terminals = true,
})

local term_status, term = pcall(require, "toggleterm.terminal")
if (not term_status) then return end

local lazygit = term.Terminal:new({ cmd = "lazygit", hidden = true })

function _lazygit_toggle()
  lazygit:toggle()
end

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>gt', '<Cmd>lua _lazygit_toggle()<CR>', opts)
