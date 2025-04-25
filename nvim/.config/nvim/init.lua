local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Remap leader
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.lazy")

-- Yank and paste with system clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', opts)
keymap({ "n", "v" }, "<leader>p", '"+p', opts)

-- Window operations
keymap({ "n", "v" }, "<M-->", "<C-w>s", opts)
keymap({ "n", "v" }, "<M-=>", "<C-w>v", opts)
keymap({ "n", "v" }, "<M-BS>", "<C-w>q", opts)
keymap({ "n", "v" }, "<M-h>", "<C-w>h", opts)
keymap({ "n", "v" }, "<M-j>", "<C-w>j", opts)
keymap({ "n", "v" }, "<M-k>", "<C-w>k", opts)
keymap({ "n", "v" }, "<M-l>", "<C-w>l", opts)
keymap("i", "<M-h>", "<Left>", opts)
keymap("i", "<M-j>", "<Down>", opts)
keymap("i", "<M-k>", "<Up>", opts)
keymap("i", "<M-l>", "<Right>", opts)

-- Tab operations
keymap({ "n", "v" }, "<leader>N", "<cmd>tabnew<CR>", opts)
keymap({ "n", "v" }, "<leader>X", "<cmd>tabc<CR>", opts)

-- Jump motions
keymap({ "n", "v" }, "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
keymap({ "n", "v" }, "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

-- Options
vim.o.cmdheight = 0
vim.o.expandtab = true
vim.o.laststatus = 3
vim.o.number = true
vim.o.relativenumber = true
vim.o.shiftwidth = 4
vim.o.statuscolumn = "%=%{v:relnum?v:relnum:v:lnum} %s"
vim.o.softtabstop = 4
vim.o.tabstop = 4
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,terminal"

-- Visualization
vim.cmd.colorscheme "catppuccin"

-- Telescope hotkeys
local telescope = require("telescope.builtin")
keymap("n", "<leader>/", telescope.current_buffer_fuzzy_find, { desc = "Telescope buffer search" })
keymap("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
keymap("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
keymap("n", "<leader>fG", telescope.live_grep, { desc = "Telescope git commits" })
keymap("n", "<leader>fc", telescope.buffers, { desc = "Telescope buffers" })
keymap("n", "<leader>fh", telescope.help_tags, { desc = "Telescope help tags" })
keymap("n", "<leader>fb", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<CR>")

-- Diagnostics
vim.diagnostic.config({
    -- virtual_text = {
    --     current_line = true,
    --     prefix = '', -- Could be '●', '▎', │, 'x', '■', , 
    -- },
    virtual_lines = true,
    jump = {
        float = true,
    },
    float = { border = 'single' },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = ' ',
            [vim.diagnostic.severity.WARN] = ' ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
            [vim.diagnostic.severity.INFO] = ' ',
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = 'DiagnosticSignError',
            [vim.diagnostic.severity.WARN] = 'DiagnosticSignWarn',
            [vim.diagnostic.severity.HINT] = 'DiagnosticSignHint',
            [vim.diagnostic.severity.INFO] = 'DiagnosticSignInfo',
        },
    },
})
keymap("n", "<leader>d", '<cmd>lua vim.diagnostic.open_float(0, { scope = "line" })<CR>', opts)
keymap("n", "<leader>dn", '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap("n", "<leader>dp", '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)

-- Git
keymap("n", "<leader>D", '<cmd>DiffviewOpen<CR>', opts)

-- Auto-save and restore session
vim.api.nvim_create_autocmd("VimLeavePre", {
    pattern = "*",
    callback = function()
        if vim.g.savesession then
            vim.api.nvim_command("mks!")
        end
    end
})

-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local mode = vim.api.nvim_get_mode().mode
        if vim.bo.modified == true and mode == 'n' then
            vim.cmd('lua vim.lsp.buf.format()')
        end
    end
})
