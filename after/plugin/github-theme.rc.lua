local status, gh = pcall(require, "github-theme")
if (not status) then return end

gh.setup({
    theme_style = "dark_default",
    function_style = "italic",
    comment_style = "italic",
    -- keyword_style = "italic",
    -- variable_style = "italic",
    sidebars = { "qf", "vista_kind", "terminal", "packer" },
})
