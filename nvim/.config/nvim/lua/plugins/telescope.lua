return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require("telescope").setup({
            defaults = {
                initial_mode = "insert",
            },
            extensions = {
                file_browser = {
                    initial_mode = "normal",
                },
            },
        })
    end
}
