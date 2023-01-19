local status, n = pcall(require, "noirbuddy")
if (not status) then return end

n.setup({
  preset = 'minimal',
  styles = {
    italic = true,
    bold = false,
    underline = false,
    undercurl = true,
  },
})
