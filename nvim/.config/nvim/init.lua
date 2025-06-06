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

-- Comment line and copy it below
keymap("n", "ycc", "yygccp", { remap = true })

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

-- Clear highlights with escape
keymap("n", "<Esc>", "<cmd>noh<CR>", opts)

-- Search within selected
keymap("v", "//", 'y/<C-R>"<CR>N')

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
vim.g.walh_dimming = 1

-- LSP
vim.lsp.enable('lua_ls')
vim.lsp.enable('nixd')
vim.lsp.enable('basedpyright')
vim.lsp.enable('clangd')

-- Snacks
local snacks = require("snacks")
keymap("n", "<leader>H", snacks.dashboard.open, { desc = "Snacks open dashboard" })
keymap("n", "<leader>/", snacks.picker.grep_buffers, { desc = "Snacks buffer search" })
keymap("n", "<leader>ff", snacks.picker.files, { desc = "Snacks find files" })
keymap("n", "<leader>fg", snacks.picker.grep, { desc = "Snacks live grep" })
keymap("n", "<leader>fG", snacks.picker.git_log, { desc = "Snacks git commits" })
keymap("n", "<leader>fc", snacks.picker.buffers, { desc = "Snacks buffers" })
keymap("n", "<leader>fh", snacks.picker.help, { desc = "Snacks help tags" })
keymap("n", "<leader>fb", snacks.explorer.reveal, { desc = "Snacks file browser relative" })
keymap("n", "<leader>fB", snacks.explorer.open, { desc = "Snacks file browser absolute" })
keymap("n", "gd", snacks.picker.lsp_definitions, { desc = "Snacks go to definition" })
keymap("n", "gD", snacks.picker.lsp_declarations, { desc = "Snacks go to declaration" })
keymap("n", "gr", snacks.picker.lsp_references, { nowait = true, desc = "Snacks find references" })

-- Diagnostics
local show_virtual_lines = false
vim.diagnostic.config({
    virtual_lines = show_virtual_lines,
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
keymap("n", "<leader>do", '<cmd>lua vim.diagnostic.open_float(0, { scope = "line" })<CR>', opts)
keymap("n", "<leader>dn", '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
keymap("n", "<leader>dp", '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
keymap("n", "<leader>di", function()
    show_virtual_lines = not show_virtual_lines
    vim.diagnostic.config({ virtual_lines = show_virtual_lines })
end, opts)

-- Git
keymap("n", "<leader>gd", '<cmd>DiffviewOpen<CR>', opts)
keymap("n", "<leader>gg", '<cmd>lua Snacks.lazygit()<CR>', opts)
keymap({ "n", "v" }, "<leader>gY", function()
    Snacks.gitbrowse({ open = function(url) vim.fn.setreg("+", url) end, notify = false })
end, { desc = "Git Browse (copy)" })

-- Persistence
keymap("n", "<leader>qS", function() require("persisted").load() end, opts)
keymap("n", "<leader>qs", function() require("persisted").select() end, opts)
keymap("n", "<leader>ql", function() require("persisted").load({ last = true }) end, opts)
keymap("n", "<leader>qd", function() require("persisted").stop() end, opts)

-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function()
        local mode = vim.api.nvim_get_mode().mode
        if vim.bo.modified == true and mode == 'n' then
            vim.cmd('lua vim.lsp.buf.format()')
        end
    end
})
