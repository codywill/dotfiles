return {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufReadPost', 'BufNewFile' },
    depedencies = { 'saghen/blink.cmp' },
    config = function()
        local lspconfig = require('lspconfig')
        local lsp_defaults = lspconfig.util.default_config
        lsp_defaults.capabilities =
            vim.tbl_deep_extend('force', lsp_defaults.capabilities, require('blink.cmp').get_lsp_capabilities())
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                if client and client.server_capabilities.inlayHintProvider then
                    vim.lsp.inlay_hint.enable(true)
                else
                    vim.lsp.inlay_hint.enable(false)
                end
            end
        })
        if vim.lsp.inlay_hint then
            vim.keymap.set('n', '<leader>ih', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, { desc = 'Toggle Inlay Hints' })
        end

        -- Servers
        local runtime_path = vim.split(package.path, ';')
        table.insert(runtime_path, 'lua/?.lua')
        table.insert(runtime_path, 'lua/?/init.lua')
        lspconfig.lua_ls.setup({
            on_init = function(client)
                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        -- Tell the language server which version of Lua you're using
                        -- (most likely LuaJIT in the case of Neovim)
                        version = 'LuaJIT',
                    },
                    -- Make the server aware of Neovim runtime files
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                        },
                    },
                })
                client.notify('workspace/didChangeConfiguration', { settings = client.config.settings })
            end,
            settings = {
                Lua = {},
            },
        })
    end
}

