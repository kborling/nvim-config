local status, tsj = pcall(require, "treesj")
if (not status) then return end

tsj.setup({
    -- Node with syntax error will not be formatted
    check_syntax_error = true,
    -- If line after join will be longer than max value,
    -- node will not be formatted
    max_join_length = 240,
    -- hold|start|end:
    -- hold - cursor follows the node/place on which it was called
    -- start - cursor jumps to the first symbol of the node being formatted
    -- end - cursor jumps to the last symbol of the node being formatted
    cursor_behavior = 'hold',
    -- Notify about possible problems or not
    notify = true,
    -- Use `dot` for repeat action
    dot_repeat = true,
})

-- For use default preset and it work with dot
vim.keymap.set('n', '<leader>m', require('treesj').toggle)
-- For extending default preset with `recursive = true`, but this doesn't work with dot
vim.keymap.set('n', '<leader>M', function()
    require('treesj').toggle({ split = { recursive = true } })
end)
