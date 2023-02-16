local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local status, lazy = pcall(require, "lazy")
if (not status) then return end

lazy.setup({
    { 'projekt0n/github-nvim-theme', version = 'v0.0.7' },
    'arturgoms/moonbow.nvim',
    {
        "jesseleite/nvim-noirbuddy",
        dependencies = { "tjdevries/colorbuddy.nvim", branch = "dev" }
    },
    'nvim-lualine/lualine.nvim', -- Statusline
    'nvim-lua/plenary.nvim', -- Common utilities
    {
        'sindrets/diffview.nvim', -- File diffs
        dependencies = 'nvim-lua/plenary.nvim'
    },
    'onsails/lspkind-nvim', -- vscode-like pictograms
    'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
    'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for neovim's built-in LSP
    'hrsh7th/nvim-cmp', -- Completion
    'neovim/nvim-lspconfig', -- LSP
    'jose-elias-alvarez/null-ls.nvim', -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',
    'akinsho/toggleterm.nvim',

    'jose-elias-alvarez/typescript.nvim', -- Extra utilities for TypeScript
    'simrat39/rust-tools.nvim', -- Extra utilities for Rust

    -- 'mfussenegger/nvim-dap', -- Debugging

    {
        'glepnir/lspsaga.nvim', -- LSP UIs
        event = "BufRead",
        dependencies = {
            { 'nvim-tree/nvim-web-devicons' },
            { 'nvim-treesitter/nvim-treesitter' }
        }
    },
    {
        'folke/trouble.nvim', -- LSP diagnostics
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    'L3MON4D3/LuaSnip',
    {
        'nvim-treesitter/nvim-treesitter',
        build = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    },
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-tree/nvim-web-devicons', -- File icons
    'johmsalas/text-case.nvim', -- Text case conversion
    {
        'ThePrimeagen/refactoring.nvim',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'nvim-treesitter/nvim-treesitter' }
        }
    },
    'ThePrimeagen/harpoon',
    'nvim-telescope/telescope.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    -- 'windwp/nvim-autopairs',
    {
        'windwp/nvim-ts-autotag',
        config = true,
    },
    'kylechui/nvim-surround',
    'norcalli/nvim-colorizer.lua',
    'folke/zen-mode.nvim',
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    { "folke/which-key.nvim",        lazy = true },
    'akinsho/nvim-bufferline.lua',
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = true,
    },
    {
        'numToStr/Comment.nvim',
        config = true,
    },
    {
        "danymat/neogen",
        dependencies = "nvim-treesitter/nvim-treesitter"
    },
    'github/copilot.vim',

    'timuntersberger/neogit', -- Magit clone
    {
        'lewis6991/gitsigns.nvim',
        config = true,
    },

    'nvim-orgmode/orgmode', -- Org mode
})
