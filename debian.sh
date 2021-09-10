#! /bin/sh
NAME="kaarmu"
BASIC_PKGS="curl openssh-client git"

# the normal directories
mkdir -p ~/.config ~/.local/{share,bin} ~/.cache

# Install basics
read -p "Press <enter> to install \"$BASIC_PKGS\""
sudo apt update
sudo apt upgrade
sudo install "$BASIC_PKGS"

# change to zsh
read -p "Press <enter> to install \"zsh starship chezmoi\""
sudo apt install zsh
chsh -s $(which zsh)

# startship prompt
sudo curl -fsSL https://starship.rs/install.sh

# dotfiles management
BINDIR=~/.local/bin sh -c "$(-fsLS git.io/chezmoi)" -- init --apply kaarmu"
