local status, lualine = pcall(require, "lualine")
if (not status) then return end

local status_ok_colors, colors = pcall(require, "noirbuddy.colors")
if (not status_ok_colors) then return end

local c = colors.all()
local theme = {
  normal = {
    a = { fg = c.gray_2, bg = c.gray_8, gui = "bold" },
    b = { fg = c.gray_3, bg = c.gray_9 },
    c = { fg = c.gray_3, bg = c.gray_8 },
  },
  insert = { a = { fg = c.black, bg = c.gray_2, gui = "bold" } },
  visual = { a = { fg = c.black, bg = c.primary, gui = "bold" } },
  replace = { a = { fg = c.black, bg = c.gray_1, gui = "bold" } },
  inactive = {
    a = { fg = c.gray_1, bg = c.black },
    b = { fg = c.gray_1, bg = c.black },
    c = { fg = c.gray_1, bg = c.black },
  },
}

lualine.setup {
  options = {
    icons_enabled = true,
    theme = theme, --'iceberg_dark',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = {
      { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
        hint = ' ' } },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' }
}
