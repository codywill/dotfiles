return {
    "propet/toggle-fullscreen.nvim",
    keys = {
        {
            "<leader>Z",
            function()
                require("toggle-fullscreen"):toggle_fullscreen()
            end,
            desc = "Toggle fullscreen"
        },
    },
}
