local mocha = require("catppuccin.palettes").get_palette("mocha")
return {
    'petertriho/nvim-scrollbar',
    dependencies = {
        'lewis6991/gitsigns.nvim',
        'kevinhwang91/nvim-hlslens',
    },
    init = function()
        require('hlslens').setup({
            override_lens = function() end,
        })
    end,
    opts = {
        handle = {
            color = mocha.overlay0,
        },
        handlers = {
            cursor = false,
            gitsigns = true,
            search = true,
        },
        marks = {
            GitAdd = { text = '│' },
            GitChange = { text = '│' },
        },
    },
}
