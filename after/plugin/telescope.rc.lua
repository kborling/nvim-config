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
vim.keymap.set('n', ';o', function()
  builtin.oldfiles()
end)
vim.keymap.set('n', ';r', function()
  builtin.live_grep()
end)
vim.keymap.set('n', ';s', function()
  builtin.grep_string()
end)
vim.keymap.set('n', ';b', function()
  builtin.buffers()
end)
vim.keymap.set('n', ';h', function()
  builtin.help_tags()
end)
vim.keymap.set('n', ';=', function()
  builtin.commands()
end)
vim.keymap.set('n', ';t', function()
  builtin.treesitter()
end)
vim.keymap.set('n', ';;', function()
  builtin.resume()
end)
vim.keymap.set('n', ';e', function()
  builtin.diagnostics()
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
