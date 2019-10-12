#/bin/bash

cp -a "$DOTFILES_DIR/dotfiles/" ~/.dotfiles
cp -a "$DOTFILES_DIR/bin/" ~/.dotfiles/bin
cp -a "$DOTFILES_DIR/iterm/" ~/.dotfiles/iterm

ln -sfv "$DOTFILES_DIR/dotfiles/.zshrc" ~
ln -sfv "$DOTFILES_DIR/dotfiles/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/dotfiles/.gitignore_global" ~