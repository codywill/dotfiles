return {
    'mrcjkb/rustaceanvim',
    version = '^6',
    init = function()
        vim.g.rustaceanvim = {
            server = {
                default_settings = {
                    ['rust-analyzer'] = {
                        check = { command = 'clippy', },
                    },
                },
            },
        }
    end,
}
