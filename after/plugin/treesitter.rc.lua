local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  textobjects = {
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- Built-in captures.
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ap"] = "@parameter.outer",
        ["ip"] = "@parameter.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["as"] = "@statement.outer",
        ["a/"] = "@comment.outer",
      },
    },
    lsp_interop = {
      enable = true,
      border = 'none',
      floating_preview_opts = {},
      peek_definition_code = {
        ["<leader>df"] = "@function.outer",
        ["<leader>dF"] = "@class.outer",
      },
    },
  },
  move = {
    enable = true,
    set_jumps = true, -- whether to set jumps in the jumplist
    goto_next_start = {
      ["]m"] = "@function.outer",
      ["]]"] = { query = "@class.outer", desc = "Next class start" },
      --
      -- You can use regex matching and/or pass a list in a "query" key to group multiple queires.
      ["]o"] = "@loop.*",
      -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
      --
      -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
      -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
      ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
      ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
    },
    goto_next_end = {
      ["]M"] = "@function.outer",
      ["]["] = "@class.outer",
    },
    goto_previous_start = {
      ["[m"] = "@function.outer",
      ["[["] = "@class.outer",
    },
    goto_previous_end = {
      ["[M"] = "@function.outer",
      ["[]"] = "@class.outer",
    },
    -- Below will go to either the start or the end, whichever is closer.
    -- Use if you want more granular movements
    -- Make it even more gradual by adding multiple queries and regex.
    goto_next = {
      ["]d"] = "@conditional.outer",
    },
    goto_previous = {
      ["[d"] = "@conditional.outer",
    }
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'org' },
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "typescript",
    "javascript",
    "jsdoc",
    "markdown",
    "c_sharp",
    "json",
    "yaml",
    "css",
    "html",
    "scss",
    "http",
    "lua",
    "rust",
    "cpp",
    "org"
  },
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
