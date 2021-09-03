USERNAME=kaarmu
UPDATE=apk update && apk upgrade
INSTALL=apk add

# Go to home and go into super-user mode
cd
su

# Install basics
$UPDATE
$INSTALL curl openssh git neovim 

# the normal directories
mkdir -p ~/.config ~/.local/{share,bin} ~/.cache
PATH=PATH:~/.local/bin

# must fix sudo
$INSTALL sudo
addgroup $USERNAME wheel
EDITOR=nvim visudo

# change to zsh
$INSTALL zsh shadow
chsh -s "$(which zsh)" 

# startship prompt
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# dotfiles
git clone -b 3.1.1 https://github.com/TheLocehiliosan/yadm.git ~/.local/share/yadm
ln -s ~/.local/share/yadm/yadm ~/.local/bin/yadm

# exit su mode and go back to normal mode
exit 
