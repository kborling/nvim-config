local status, rust = pcall(require, "rust-tools")
if (not status) then return end
rust.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rust.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>cg", rust.code_action_group.code_action_group, { buffer = bufnr })
      -- Runnables
      vim.keymap.set("n", "<leader>cr", "<Cmd>RustRunnables<CR>", { buffer = bufnr })
    end,
  }
})

local opts = { noremap = true, silent = true, expr = false }

