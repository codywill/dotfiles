local splash_preset = "fire"
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    dependencies = { "amansingh-afk/milli.nvim" },
    opts = function()
        local splash = require("milli").load({ splash = splash_preset })
        return {
            bigfile = {
                enabled = true,
                line_length = 2000,
            },
            dashboard = {
                enabled = true,
                preset = {
                    header = table.concat(splash.frames[1], "\n"),
                },
                sections = {
                    { section = "header", padding = 1 },
                    { icon = " ", section = "keys", indent = 2, padding = 1 },
                    { section = "startup" },
                },
            },
            explorer = {
                enabled = true,
            },
            indent = { enabled = true },
            input = { enabled = true },
            lazygit = {
                config = {
                    notARepository = "skip",
                },
            },
            picker = {
                enabled = true,
                hidden = true,
                sources = {
                    explorer = {
                        jump = {
                            close = true,
                        },
                        layout = {
                            preset = "default",
                            preview = true,
                        },
                    },
                },
                win = {
                    input = {
                        keys = {
                            ["<a-->"] = { "edit_split", mode = { "i", "n" } },
                            ["<a-=>"] = { "edit_vsplit", mode = { "i", "n" } },
                        },
                    },
                    list = {
                        keys = {
                            ["<a-->"] = { "edit_split", mode = { "i", "n" } },
                            ["<a-=>"] = { "edit_vsplit", mode = { "i", "n" } },
                        },
                    },
                },
            },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            -- scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
        }
    end,
    config = function(_, opts)
        require("snacks").setup(opts)
        require("milli").snacks({ splash = splash_preset, loop = true })
    end,
}
