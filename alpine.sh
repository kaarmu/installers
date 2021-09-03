#! /bin/sh                                                                   NAME="kaarmu"                                                                UPDATE="apk update && apk upgrade"                                           INSTALL="apk add"                                                            BASIC_PKGS="curl openssh git neovim nano"                                    
# the normal directories
mkdir -p ~/.config ~/.local/{share,bin} ~/.cache
PATH=$PATH:~/.local/bin

# Install basics
read -p "Press <enter> to install \"$BASIC_PKGS\""
su -c "$UPDATE && $INSTALL $BASIC_PKGS"

# must fix sudo
su -c $INSTALL sudo && addgroup $NAME wheel
read -p "Press <enter> to update sudoers file"
EDITOR=nano visudo

# change to zsh
sudo $INSTALL zsh shadow
sudo chsh -s "$(which zsh)"

# startship prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# dotfiles
sh -c "$(curl -fsLS git.io/chezmoi)" -- init --apply kaarmu
