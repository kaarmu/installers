#! /bin/sh
NAME="kaarmu"
UPDATE="apk update && apk upgrade"
INSTALL="apk add"
BASIC_PKGS="curl openssh git neovim nano"

# the normal directories
mkdir -p ~/.config ~/.local/{share,bin} ~/.cache

# Install basics
read -p "Press <enter> to install \"$BASIC_PKGS\""
su -c "$UPDATE && $INSTALL $BASIC_PKGS"

# must fix sudo
read -p "Press <enter> to install and configure \"sudo\""
su -c "$INSTALL sudo && addgroup $NAME wheel && EDITOR=nano visudo"

# change to zsh
read -p "Press <enter> to install \"zsh starship chezmoi\""
su -c "$INSTALL zsh shadow && chsh -s $(which zsh)"

# startship prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# dotfiles management
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply kaarmu
