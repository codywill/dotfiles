# Installing

Install `WezTerm` and `VictorMono Nerd Font` on your host:

- [WezTerm](https://wezterm.org/)
    - (WSL): After installing the dotfiles, create a symlink to `.wezterm.lua` in your Windows home directory. Run the following in `cmd.exe` as admin:

```cmd
mklink %userprofile%\.wezterm.lua \\wsl.localhost\{path\to\dotfiles}\wezterm\.wezterm.lua
```

- [VictorMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/VictorMono.zip)

Run the install script from this directory:

```bash
$ ./install.sh
```

# Packages

- `build-essential`
- `cmake`
- `fd-find`
- `lua5.1`
- `liblua5.1-dev`
- `ripgrep`
- `stow`
- `tmux`
- `unzip`

# Software

- [neovim](https://neovim.io/)
- [Starship](https://starship.rs/)
- [fish](https://fishshell.com/)
- [luarocks](https://luarocks.org/)

# Plugins

tmux
- [tpm](https://github.com/tmux-plugins/tpm)
- [tmux-powerline](https://github.com/erikw/tmux-powerline)

neovim
- [blink.cmp](https://github.com/Saghen/blink.cmp)
- [catppuccin](https://github.com/catppuccin/nvim)
- [FixCursorHold](https://github.com/antoinemadec/FixCursorHold.nvim) (dep)
- [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) (dep)
- [lazy](https://lazy.folke.io/)
- [lazydev](https://github.com/folke/lazydev.nvim)
- [neotest](https://github.com/nvim-neotest/neotest)
- [noice](https://github.com/folke/noice.nvim)
- [nui](https://github.com/MunifTanjim/nui.nvim) (dep)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-nio](https://github.com/nvim-neotest/nvim-nio) (dep)
- [nvim-notify](https://github.com/rcarriga/nvim-notify) (dep)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-treesitter-textobjects](https://github.com/nvim-treesitter/nvim-treesitter-textobjects)
- [plenary](https://github.com/nvim-lua/plenary.nvim) (dep)
- [rustaceanvim](https://github.com/mrcjkb/rustaceanvim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)

# Language Servers

- [lua-language-server](https://luals.github.io/)
- [rust-analyzer](https://github.com/rust-lang/rust-analyzer)

