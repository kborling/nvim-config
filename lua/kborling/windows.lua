vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }

vim.opt.shiftwidth   = 4
vim.opt.softtabstop  = 4
vim.opt.tabstop      = 4

-- Spacing between lines
vim.opt.linespace    = 1

-- Nushell
-- vim.opt.shell        = 'nu.exe'
-- vim.opt.shellcmdflag = '-c'
-- vim.opt.shellxquote  = ''
-- vim.opt.shellquote   = ''

-- Powershell
vim.opt.shell        = 'powershell.exe'
vim.opt.shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
vim.opt.shellxquote  = ''
vim.opt.shellquote   = ''
vim.opt.shellpipe    = '| Out-File -Encoding UTF8 %s'
vim.opt.shellredir   = '| Out-File -Encoding UTF8 %s'
