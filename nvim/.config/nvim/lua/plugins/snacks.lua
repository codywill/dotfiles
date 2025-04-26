local header = table.concat({
    [[   █  █   ]],
    [[   █ ██   ]],
    [[   ████   ]],
    [[   ██ ███   ]],
    [[   █  █   ]],
    [[             ]],
    [[ n e o v i m ]],
}, '\n')
return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = {
            enabled = true,
            example = "advanced",
            preset = {
                header = {
                    header,
                    hl = 'NeovimDashboardLogo',
                    align = 'center',
                },
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
    },
}
