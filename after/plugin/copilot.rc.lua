local status, copilot = pcall(require, "copilot")
if (not status) then return end

copilot.setup({
    -- suggestion = { enabled = false },
    panel = { enabled = false },
    suggestion = {
        enabled = true,
        auto_trigger = true,
        debounce = 75,
        keymap = {
            accept = "<C-CR>",
            accept_word = false,
            accept_line = false,
            next = "<C-.>",
            prev = "<C-,>",
            dismiss = "<C-]>",
        },
    },
    filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = true,
        gitrebase = true,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
    },
    copilot_node_command = 'node', -- Node.js version must be > 16.x
    server_opts_overrides = {},
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>cp', '<Cmd>Copilot toggle<CR>', opts)
