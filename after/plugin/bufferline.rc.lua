local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

bufferline.setup({
  options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
  },
  highlights = {
    separator = {
      fg = '#212121',
      bg = '#121212',
    },
    separator_selected = {
      fg = '#212121',
    },
    background = {
      fg = '#535353',
      bg = '#121212'
    },
    buffer_selected = {
      fg = '#d5d5d5',
      bold = false,
    },
    fill = {
      bg = '#212121'
    }
  },
})

vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', {})
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', {})
