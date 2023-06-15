#!/usr/bin/env bash

if ! is-macos -o ! is-executable brew; then
	echo "Skipped: Tmux"
	return
fi

mkdir -p ~/.tmux/plugins

git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

"$HOME/.tmux/plugins/tpm/bin/install_plugins"
