local keymap = vim.keymap

-- Save
keymap.set('n', ':W', ':w')

-- Replace
keymap.set('n', 'x', '"_x')

-- Execute Lua script in {file}.
keymap.set('n', ';l', ':luafile %<CR>')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Disable help. Use Esc instead.
keymap.set('n', '<F1>', '<Esc>')
keymap.set('i', '<F1>', '<Esc>')
keymap.set('v', '<F1>', '<Esc>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Replace all
keymap.set('n', 'S', ':%s///cg<Left><Left><Left><Left>')

-- Move lines
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Indent
keymap.set('v', '<', '<gv')
keymap.set('v', '>', '>gv')

-- Reduce empty lines into one
keymap.set('n', ';r', ':g/^$/,/./-1j<CR>:noh<CR>')

-- Kill buffer without removing window split
-- Shows previous buffer as the new buffer
keymap.set('n', '<leader>d', ':bp|bd#<CR>')

-- New tab
keymap.set('n', 'te', ':tabedit')
-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- Move window
keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', 'sh', '<C-w>h')
keymap.set('', 'sk', '<C-w>k')
keymap.set('', 'sj', '<C-w>j')
keymap.set('', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')
