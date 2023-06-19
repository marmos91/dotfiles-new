#!/usr/bin/env bash

mkdir -p ~/.tmux/plugins

git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

"$HOME/.tmux/plugins/tpm/bin/install_plugins"
