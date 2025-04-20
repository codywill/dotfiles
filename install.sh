#!/bin/bash

install_packages() {
    pkgs=(build-essential cmake fd-find lua5.1 liblua5.4-dev ripgrep stow tmux unzip)
    sudo apt-get -y --ignore-missing install "${pkgs[@]}"
}

install_neovim() {
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    sudo rm -rf /opt/nvim
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
}

install_starship() {
    curl -sS https://starship.rs/install.sh | sh
}

install_fish() {
    sudo apt-add-repository ppa:fish-shell/release-4
    sudo apt update
    sudo apt install fish
}

install_tpm() {
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

install_luarocks() {
    wget https://luarocks.org/releases/luarocks-3.11.1.tar.gz
    tar zxpf luarocks-3.11.1.tar.gz
    pushd luarocks-3.11.1
    ./configure && make && sudo make install
    popd
    rm -rf luarocks-3.11.1
    rm luarocks-3.11.1.tar.gz
}

install_dotfiles() {
    stow -v -t ~ */
}

install_packages
install_neovim
install_starship
install_fish
install_tpm
install_luarocks
install_dotfiles

