return {
    "catppuccin/nvim", name = "catppuccin", priority = 1000,
    config = function()
        require("catppuccin").setup {
            color_overrides = {
                all = {
                    mauve = "#f5c2e7",
                    base = "#202020"
                },
            },
        }
    end
}
