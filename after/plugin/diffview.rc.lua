local status, diffview = pcall(require, "diffview")
if (not status) then return end
diffview.setup()

-- vim.keymap.set('n', ';d', '<Cmd>DiffviewOpen<Return>')
-- vim.keymap.set('n', ';D', '<Cmd>DiffviewFileHistory<Return>')
-- vim.keymap.set('n', ';q', '<Cmd>DiffviewClose<Return>')
