local nix_info = require(vim.g.nix_info_plugin_name)
local global_colors = nix_info(nil, "info", "palette")
return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        color_overrides = {
            all = global_colors,
        },
        custom_highlights = function(colors)
            return {
                LineNrAbove = { fg = colors.surface1 },
                LineNr = { fg = colors.subtext0 },
                LineNrBelow = { fg = colors.surface1 },
                TabLineSel = { fg = colors.subtext0, bg = colors.none },
                TabLineSelNum = { fg = colors.blue, bg = colors.none, bold = true },
                TabLine = { fg = colors.overlay1, bg = colors.none },
                TabLineNum = { fg = colors.surface2, bg = colors.none },
                TabLineFill = { bg = colors.none },
            }
        end,
        integrations = {
            blink_cmp = true,
            diffview = false,
            gitsigns = true,
            neotest = true,
            noice = true,
            snacks = {
                enabled = true,
                indent_scope_color = "overlay0",
            },
            treesitter = true,
        },
        transparent_background = true,
    }
}
