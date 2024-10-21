local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
      filter = function(client)
        return client.name == "null-ls"
      end,
      bufnr = bufnr,
  })
end

-- Add .cmd to lsp commands on windows so they can be found
local function add_cmd_suffix(cmd)
  if vim.fn.has('win32') == 1 then
    return cmd .. '.cmd'
  end
  return cmd
end

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.stylelint.with({
            command = add_cmd_suffix('stylelint')
        }),
        null_ls.builtins.diagnostics.stylelint.with({
            command = add_cmd_suffix('stylelint')
        }),
        null_ls.builtins.diagnostics.eslint_d.with({
            diagnostics_format = '[eslint] #{m}\n(#{c})',
            command = add_cmd_suffix('eslint_d')
        }),
        null_ls.builtins.formatting.eslint_d.with({
            formatting_format = '[eslint] --fix-to-stdout --stdin --stdin-filename %f:%l:%c: %m',
            command = add_cmd_suffix('eslint_d')
        }),
        null_ls.builtins.code_actions.eslint_d.with({
            command = add_cmd_suffix('eslint_d')
        }),
        -- null_ls.builtins.diagnostics.clang_check,
        null_ls.builtins.diagnostics.cppcheck,
    },
    on_attach = function(client, bufnr)
      if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              lsp_formatting(bufnr)
            end,
        })
      end
    end
}

vim.api.nvim_create_user_command(
    'DisableLspFormatting',
    function()
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
    end,
    { nargs = 0 }
)
