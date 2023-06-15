#!/usr/bin/env bash

if ! is-macos; then
	echo "Skipped: Karabiner-elements"
	return
fi

rm -rf "$HOME/.config/karabiner"
ln -sfv "$DOTFILES_DIR/karabiner" "$HOME/.config/karabiner"
