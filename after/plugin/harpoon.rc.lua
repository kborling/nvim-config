local status, harpoon = pcall(require, "harpoon")
if (not status) then return end
harpoon.setup({})

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")
-- local harpoon_term = require("harpoon.term")
local harpoon_cmd_ui = require("harpoon.cmd-ui")

vim.keymap.set('n', '<leader>hp', function()
  harpoon_ui.nav_prev()
end)

vim.keymap.set('n', '<leader>hn', function()
  harpoon_ui.nav_next()
end)

-- vim.keymap.set('n', '<leader>ht', function()
--   harpoon_term.gotoTerminal(1)
-- end)

vim.keymap.set('n', '<leader>ha', function()
  harpoon_mark.add_file()
end)
