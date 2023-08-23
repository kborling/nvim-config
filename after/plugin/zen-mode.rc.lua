local status, zenMode = pcall(require, "zen-mode")
if (not status) then return end

zenMode.setup {
    window = {
        width = 0.85,
    }
}

vim.keymap.set('n', '<leader>tz', '<cmd>ZenMode<cr>', { silent = true })
