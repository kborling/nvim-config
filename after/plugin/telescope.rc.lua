local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
        },
        file_ignore_patterns = { "^./.git/", "^node_modules/", "^vendor/" },
        mappings = {
            n = {
                ["q"] = actions.close
            },
            i = {
                ["<C-h>"] = "which_key"
            },
        },
    },
    extensions = {
        file_browser = {
            theme = "dropdown",
            -- disables netrw and use telescope-file-browser in its place
            hijack_netrw = true,
            mappings = {
                -- your custom insert mode mappings
                ["i"] = {
                    ["<C-w>"] = function() vim.cmd('normal vbd') end,
                },
                ["n"] = {
                    -- your custom normal mode mappings
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                      vim.cmd('startinsert')
                    end
                },
            },
        },
    },
}

telescope.load_extension("file_browser")
telescope.load_extension("refactoring")
telescope.load_extension("harpoon")
telescope.load_extension("projects")

vim.keymap.set('v', '<leader>rr', function()
  telescope.extensions.refactoring.refactors()
end)

vim.keymap.set('n', '<leader>hh', function()
  telescope.extensions.harpoon.marks()
end)

vim.keymap.set('n', '<leader>f', function()
  builtin.git_files()
end)
vim.keymap.set('n', ';f',
    function()
      builtin.find_files({
          no_ignore = false,
          hidden = false
      })
    end)
vim.keymap.set('n', '<leader>\\', function()
  builtin.oldfiles()
end)
vim.keymap.set('n', '<leader>r', function()
  builtin.live_grep()
end)
vim.keymap.set('n', '<leader>s', function()
  builtin.grep_string()
end)
vim.keymap.set('n', '<C-s>', function()
  builtin.current_buffer_fuzzy_find()
end)
vim.keymap.set('n', '<leader>b', function()
  builtin.buffers()
end)
vim.keymap.set('n', '<leader>y', function()
  builtin.registers()
end)
vim.keymap.set('n', '<leader>h', function()
  builtin.help_tags()
end)
vim.keymap.set('n', '<leader>m', function()
  builtin.marks()
end)
vim.keymap.set('n', '<leader>p', function()
  telescope.extensions.projects.projects()
end)
vim.keymap.set('n', '<leader>to', function()
  builtin.vim_options()
end)
vim.keymap.set('n', '<leader>tt', function()
  builtin.colorscheme()
end)
-- vim.keymap.set('n', ';t', function()
--   builtin.treesitter()
-- end)
vim.keymap.set('n', ';;', function()
  builtin.resume()
end)
-- Lsp

vim.keymap.set('n', 'ge', function()
  builtin.diagnostics()
end)

vim.keymap.set('n', '<leader>cr', function()
  builtin.lsp_references()
end)

vim.keymap.set('n', '<leader>cd', function()
  builtin.lsp_definitions()
end)

vim.keymap.set('n', '<leader>cD', function()
  builtin.lsp_type_definitions()
end)

vim.keymap.set('n', '<leader>ci', function()
  builtin.lsp_implementations()
end)

vim.keymap.set('n', '<leader>cs', function()
  builtin.lsp_document_symbols()
end)

vim.keymap.set('n', '<leader>cS', function()
  builtin.lsp_workspace_symbols()
end)

vim.keymap.set('n', '<leader>co', function()
  builtin.lsp_incoming_calls()
end)

vim.keymap.set('n', '<leader>cO', function()
  builtin.lsp_outgoing_calls()
end)

-- Git
vim.keymap.set('n', '<leader>gb', function()
  builtin.git_branches()
end)
vim.keymap.set('n', '<leader>gc', function()
  builtin.git_bcommits()
end)
vim.keymap.set('n', '<leader>gC', function()
  builtin.git_commits()
end)
vim.keymap.set('n', '<leader>gs', function()
  builtin.git_status()
end)
vim.keymap.set('n', '<leader>gz', function()
  builtin.git_stash()
end)

vim.keymap.set("n", "<leader>/", function()
  telescope.extensions.file_browser.file_browser({
      path = "%:p:h",
      cwd = telescope_buffer_dir(),
      respect_gitignore = false,
      hidden = true,
      grouped = true,
      previewer = false,
      initial_mode = "insert",
      layout_config = { height = 40 }
  })
end)
