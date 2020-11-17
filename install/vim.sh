if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Vim"
  return
fi

vim +PlugInstall +qall