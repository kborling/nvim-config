local status, n = pcall(require, "NeoSolarized")
if (not status) then return end

n.setup({
    style = "dark",         -- "dark" or "light"
    transparent = true,     -- true/false; Enable this to disable setting the background color
    terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
    enable_italics = true,  -- Italics for different hightlight groups (eg. Statement, Condition, Comment, Include, etc.)
    styles = {
        -- Style to be applied to different syntax groups
        comments = { italic = true },
        keywords = { italic = true },
        functions = { bold = true },
        variables = {},
        string = { italic = true },
        underline = true, -- true/false; for global underline
        undercurl = true, -- true/false; for global undercurl
    },
    -- Add specific hightlight groups
    -- on_highlights = function(highlights, colors)
    -- highlights.Include.fg = colors.red
    -- end,
})

vim.cmd [[ colorscheme NeoSolarized ]]
