UPDATE=apk update && apk upgrade
INSTALL=apk add

$UPDATE
$INSTALL openssh git curl neovim 

mkdir -p ~/.config ~/.local/{share,bin} ~/.cache
PATH=PATH:~/.local/bin

git clone https://github.com/TheLocehiliosan/yadm.git ~/.local/share/yadm
ln -s ~/.local/share/yadm/yadm ~/.local/bin/yadm

if [ which chsh ] then
  $INSTALL zsh
  chsh -s $(which zsh)
  # random dependencies
  $INSTALL ncurses
  $INSTALL zsh-vcs # for alpine
  # git clone https://github.com/zdharma/zinit.git ~/.zinit/bin # change this to XDG later; use ZINIT[HOME_DIR]
else
  echo 'Could not install zsh'
fi

