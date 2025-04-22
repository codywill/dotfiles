return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            color_overrides = {
                all = {
                    mauve = "#f5c2e7",
                    base = "#202020"
                },
            },
            integrations = {
                blink_cmp = true,
                neotest = true,
                noice = true,
                treesitter = true,
                telescope = {
                    enabled = true
                },
            }
        })
    end
}
