if ! is-macos -o ! is-executable brew; then
	echo "Skipped: Vim"
	return
fi

mkdir -p ~/.tmux/plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

~/.tmux/plugins/tpm/bin/install_plugins
