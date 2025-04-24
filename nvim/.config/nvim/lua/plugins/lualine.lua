return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local custom_catppuccin = require('lualine.themes.catppuccin')
        -- custom_catppuccin.normal.c.bg = '#202020'
        -- custom_catppuccin.inactive.c.bg = '#202020'

        require('lualine').setup({
            options = {
                theme = custom_catppuccin,
            },
        })
    end
}
