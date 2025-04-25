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
                    hidden = {
                        file_browser = true,
                        folder_browser = true,
                    },
                    initial_mode = "normal",
                },
                fzf = {
                    fuzzy = true,
                    override_generic_sorter = true,
                    case_mode = "smart_case",
                }
            },
            pickers = {
                live_grep = {
                    file_ignore_patterns = { '.git', '.venv' },
                    additional_args = function(_)
                        return { "--hidden" }
                    end
                },
                find_files = {
                    file_ignore_patterns = { '.git', '.venv' },
                    hidden = true,
                }
            }
        })
        require("telescope").load_extension("fzf")
    end
}
