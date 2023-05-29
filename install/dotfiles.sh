#/bin/bash

cp -a "$DOTFILES_DIR/dotfiles/" ~/.dotfiles
cp -a "$DOTFILES_DIR/bin/" ~/.dotfiles/bin
cp -a "$DOTFILES_DIR/iterm/" ~/.dotfiles/iterm

ln -sfv ~/.dotfiles/.zshrc ~
ln -sfv ~/.dotfiles/.p10k.zsh ~
ln -sfv ~/.dotfiles/.tmux ~
ln -sfv ~/.dotfiles/.vim ~
ln -sfv ~/.dotfiles/.vimrc ~
ln -sfv ~/.dotfiles/.tmux.conf ~
ln -sfv ~/.dotfiles/.gitconfig ~
ln -sfv ~/.dotfiles/.gitignore_global ~
ln -sfv ~/.dotfiles/.vale.ini ~
