require('kborling.base')
require('kborling.highlights')
require('kborling.maps')
require('kborling.plugins')

local has = vim.fn.has
local is_mac = has "macunix"
local is_win = has "win32"

if is_mac then
  require('kborling.macos')
end
if is_win then
  require('kborling.windows')
end
