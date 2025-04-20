local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap leader
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

-- Yank and paste with system clipboard
keymap({"n", "v"}, "<leader>y", '"+y', opts)
keymap({"n", "v"}, "<leader>p", '"+p', opts)

-- Options 
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = number
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- Visualization
vim.cmd.colorscheme "catppuccin"

-- Telescope hotkeys
local telescope = require("telescope.builtin")
keymap("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
keymap("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
keymap("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
keymap("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
keymap("n", "<leader>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>" )

