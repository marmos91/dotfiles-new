#!/usr/bin/env bash

# Create config directory if it does not exist
mkdir -p "$HOME/.config"

for CONFIG_DIR in "$DOTFILES_DIR"/config/*/; do
	BASENAME=$(basename "$CONFIG_DIR")

	rm -rf "$HOME/.config/$BASENAME"
	ln -sfv "$CONFIG_DIR" "$HOME/.config/$BASENAME"
done
