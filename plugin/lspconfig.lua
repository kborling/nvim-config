--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local augroup_format = vim.api.nvim_create_augroup("Format", { clear = true })
local enable_format_on_save = function(_, bufnr)
    vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup_format,
        buffer = bufnr,
        callback = function()
            vim.lsp.buf.format({ bufnr = bufnr })
        end,
    })
end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    --local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    --buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Add .cmd to lsp commands on windows so they can be found
local function add_cmd_suffix(cmd)
    if vim.fn.has('win32') == 1 then
        return cmd .. '.cmd'
    end
    return cmd
end

nvim_lsp.ts_ls.setup {
    on_attach = on_attach,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { add_cmd_suffix("typescript-language-server"), "--stdio" },
    capabilities = capabilities
}

-- NOTE: Change to angular project path
local project_library_path = "~/Projects/angular/fresh/node_modules"
local angular_cmd = { add_cmd_suffix("ngserver"), "--stdio", "--tsProbeLocations",
    project_library_path, "--ngProbeLocations", project_library_path }
-- local angular_cmd = { add_cmd_suffix("ngserver"), "--stdio", "--tsProbeLocations", "", "--ngProbeLocations", "" }
nvim_lsp.angularls.setup {
    on_attach = on_attach,
    cmd = angular_cmd,
    on_new_config = function(new_config, new_root_dir)
        new_config.cmd = angular_cmd
    end,
    capabilities = capabilities
}

nvim_lsp.tailwindcss.setup {
    on_attach = on_attach,
    cmd = { add_cmd_suffix("tailwindcss-language-server"), "--stdio" },
    capabilities = capabilities
}

nvim_lsp.html.setup {
    on_attach = on_attach,
    cmd = { add_cmd_suffix("vscode-html-language-server"), "--stdio" },
    capabilities = capabilities
}

nvim_lsp.emmet_ls.setup {
    on_attach = on_attach,
    cmd = { add_cmd_suffix("emmet-ls"), "--stdio" },
    capabilities = capabilities
}

nvim_lsp.csharp_ls.setup {
    on_attach = on_attach,
    cmd = { add_cmd_suffix("csharp-ls") },
    capabilities = capabilities
}

nvim_lsp.jsonls.setup {
    on_attach = on_attach,
    cmd = { add_cmd_suffix("vscode-json-language-server"), "--stdio" },
    capabilities = capabilities
}
local clang_capabilities = vim.lsp.protocol.make_client_capabilities()
clang_capabilities.offsetEncoding = { "utf-16" }
nvim_lsp.clangd.setup {
    on_attach = on_attach,
    capabilities = clang_capabilities
}

nvim_lsp.rls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "rustup", "run", "stable", "rust-analyzer" },
    settings = {
        rust = {
            unstable_features = true,
            build_on_save = false,
            all_features = true,
        },
    },
}

nvim_lsp.lua_ls.setup {
    cmd = { "lua-language-server" },
    capabilities = capabilities,
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        enable_format_on_save(client, bufnr)
    end,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false
            },
        },
    },
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
    }
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
})
