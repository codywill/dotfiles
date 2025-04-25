local mocha = require("catppuccin.palettes").get_palette("mocha")
return {
    'petertriho/nvim-scrollbar',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'kevinhwang91/nvim-hlslens',
    },
    opts = {
        handlers = {
            gitsigns = true,
            search = true,
        },
    },
    config = function()
        require('scrollbar').setup({
            handle = {
                color = mocha.overlay0,
            },
            handlers = {
                cursor = false,
            },
            marks = {
                GitAdd = { text = '│' },
                GitChange = { text = '│' },
            },
        })
        require('hlslens').setup({
            override_lens = function() end,
        })
    end
}
