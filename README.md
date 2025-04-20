# Packages

TODO: Add a script to install these (and everything else)

- `build-essential`
- `cmake`
- `fd-find`
- `lua5.1`
- `liblua5.4-dev`
- `ripgrep`
- `stow`
- `tmux`
- `unzip`

# Installing the dotfiles

From this directory:

```bash
$ stow -v -t ~ */
```

# Software

- [neovim](https://neovim.io/)
- [Starship](https://starship.rs/)
- [fish](https://fishshell.com/)
- [WezTerm](https://wezterm.org/)
    - NOTE: If you're using SSH or WSL this needs to be installed on the host.
    - (WSL): After installing the dotfiles, create a symlink to `.wezterm.lua` in `$HOME`:

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

