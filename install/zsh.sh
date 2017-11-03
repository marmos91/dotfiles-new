if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Zsh"
  return
fi