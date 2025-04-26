#!/bin/bash

#TODO: Check for existing installs and handle them more gracefully 
#TODO: Support command line arg(s) for individual steps

sudo echo ""

install_packages() {
    pkgs=(build-essential cmake fd-find lua5.1 liblua5.1-dev ripgrep stow tmux unzip)
    sudo apt-get update && \
    sudo apt-get -y --ignore-missing install "${pkgs[@]}" && \
    chsh -s $(which tmux)
}

install_lua_language_server() {
    curl -LO https://github.com/LuaLS/lua-language-server/releases/download/3.14.0/lua-language-server-3.14.0-linux-x64.tar.gz && \
    rm -rf ~/.local/share/lua-language-server && \
    mkdir -p ~/.local/share/lua-language-server && \
    tar -C ~/.local/share/lua-language-server -xzf lua-language-server-3.14.0-linux-x64.tar.gz && \
    rm lua-language-server-3.14.0-linux-x64.tar.gz && \
    sudo ln -s ~/.local/share/lua-language-server/bin/lua-language-server /usr/bin/lua-language-server
}

install_neovim() {
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz && \
    sudo rm -rf /opt/nvim && \
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz && \
    rm nvim-linux-x86_64.tar.gz
}

install_starship() {
    curl -sS https://starship.rs/install.sh | sh -s -- "-y"
}

install_fish() {
    sudo apt-add-repository -y ppa:fish-shell/release-4 && \
    sudo apt update && \
    sudo apt install -y fish
}

install_tpm() {
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

install_luarocks() {
    wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz && \
    tar zxpf luarocks-3.11.1.tar.gz && \
    pushd luarocks-3.11.1 && \
    ./configure && make && sudo make install && \
    popd && \
    rm -rf luarocks-3.11.1 && \
    rm luarocks-3.11.1.tar.gz
}

install_rust_analyzer() {
    mkdir -p ~/.local/bin && \
    curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer && \
    chmod +x ~/.local/bin/rust-analyzer && \
    sudo ln -s ~/.local/bin/rust-analyzer /usr/bin/rust-analyzer
}

install_colorscripts() {
    git clone https://gitlab.com/dwt1/shell-color-scripts.git && \
    pushd shell-color-scripts && \
    sudo make install && \
    popd && \
    rm -rf shell-color-scripts
}

install_lazygit() {
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz" && \
    tar xf lazygit.tar.gz lazygit && \
    sudo install lazygit -D -t /usr/local/bin/ && \
    rm lazygit lazygit.tar.gz
}

install_dotfiles() {
    stow -v -t ~ */ && \
    ~/.tmux/plugins/tpm/scripts/install_plugins.sh
}

install_packages
install_lua_language_server
install_neovim
install_starship
install_fish
install_tpm
install_luarocks
install_rust_analyzer
install_colorscripts
install_lazygit
install_dotfiles 

