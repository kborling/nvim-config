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

vim.keymap.set('n', ';F', function()
  builtin.git_files()
end)
vim.keymap.set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = false
    })
  end)
vim.keymap.set('n', ';\\', function()
  builtin.oldfiles()
end)
vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end)
vim.keymap.set('n', ';s', function()
  builtin.grep_string()
end)
vim.keymap.set('n', '<C-s>', function()
  builtin.current_buffer_fuzzy_find()
end)
vim.keymap.set('n', ';b', function()
  builtin.buffers()
end)
vim.keymap.set('n', ';y', function()
  builtin.registers()
end)
vim.keymap.set('n', ';h', function()
  builtin.help_tags()
end)
vim.keymap.set('n', ';m', function()
  builtin.marks()
end)
vim.keymap.set('n', ';o', function()
  builtin.vim_options()
end)
vim.keymap.set('n', ';=', function()
  builtin.commands()
end)
vim.keymap.set('n', ';t', function()
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

vim.keymap.set('n', ';cr', function()
  builtin.lsp_references()
end)

vim.keymap.set('n', ';cd', function()
  builtin.lsp_definitions()
end)

vim.keymap.set('n', ';cD', function()
  builtin.lsp_type_definitions()
end)

vim.keymap.set('n', 'gi', function()
  builtin.lsp_implementations()
end)

vim.keymap.set('n', 'gs', function()
  builtin.lsp_document_symbols()
end)

vim.keymap.set('n', 'gS', function()
  builtin.lsp_workspace_symbols()
end)

vim.keymap.set('n', 'go', function()
  builtin.lsp_incoming_calls()
end)

vim.keymap.set('n', 'gO', function()
  builtin.lsp_outgoing_calls()
end)

-- Git
vim.keymap.set('n', ';gb', function()
  builtin.git_branches()
end)
vim.keymap.set('n', ';gc', function()
  builtin.git_bcommits()
end)
vim.keymap.set('n', ';gC', function()
  builtin.git_commits()
end)
vim.keymap.set('n', ';gs', function()
  builtin.git_status()
end)
vim.keymap.set('n', ';gz', function()
  builtin.git_stash()
end)

vim.keymap.set("n", ";/", function()
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
