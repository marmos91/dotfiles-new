if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Vim"
  return
fi

~/.tmux/plugins/tpm/bin/install_plugins