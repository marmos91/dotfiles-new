#!/usr/bin/env bash

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

mkdir -p ~/.dotfiles

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Bunch of symlinks

ln -sfv "$DOTFILES_DIR/runcom/.zshrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~

# Installing fonts

cp "$DOTFILES_DIR/fonts/SourceCodePro+Powerline+Awesome+Regular.ttf" ~/Library/Fonts
# cp "$DOTFILES_DIR/fonts/Bariol.ttf" ~/Library/Fonts

. "$DOTFILES_DIR/install/brew.sh"
. "$DOTFILES_DIR/install/brew-cask.sh"
. "$DOTFILES_DIR/install/npm.sh"
. "$DOTFILES_DIR/install/zsh.sh"

# MacOS preferences

. "$DOTFILES_DIR/macos/dock.sh"
. "$DOTFILES_DIR/macos/defaults.sh"