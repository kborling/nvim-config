local status, diffview = pcall(require, "diffview")
if (not status) then return end
diffview.setup()

vim.keymap.set('n', ';d', ':DiffviewOpen<Return>')
vim.keymap.set('n', ';D', ':DiffviewFileHistory<Return>')
vim.keymap.set('n', ';q', ':DiffviewClose<Return>')
