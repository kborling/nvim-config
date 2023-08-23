local status, neogit = pcall(require, "neogit")
if (not status) then return end
neogit.setup({})

vim.keymap.set('n', '<leader>gg', function()
    neogit.open()
end)
