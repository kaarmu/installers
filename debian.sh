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
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# dotfiles management
sh -c "BINDIR=/home/$NAME/.local/bin $(curl -fsLS git.io/chezmoi) -- init --apply kaarmu"
