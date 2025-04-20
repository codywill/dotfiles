# Installing

Install `WezTerm` and `VictorMono Nerd Font` on your host:

- [WezTerm](https://wezterm.org/)
    - (WSL): After installing the dotfiles, create a symlink to `.wezterm.lua` in `$HOME`:
- [VictorMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/VictorMono.zip)

Run the install script from this directory:

```bash
$ install.sh
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

```bash
mklink $HOME\.wezterm.lua \\wsl.localhost\{path\to\dotfiles}\wezterm\.wezterm.lua
```

# Plugins

tmux
- [tpm](https://github.com/tmux-plugins/tpm)
- [tmux-powerline](https://github.com/erikw/tmux-powerline)

neovim
- [lazy.nvim](https://lazy.folke.io/)
    - [luarocks](https://luarocks.org/)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
    - [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
    - [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim)
- [catppuccin.nvim](https://github.com/catppuccin/nvim)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

