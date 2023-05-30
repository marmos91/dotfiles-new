if ! is-macos -o ! is-executable nvim; then
  echo "Skipped: NVim"
  return
fi

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

rm -rf ~/.config/nvim/lua/custom
ln -sfv "$DOTFILES_DIR/nvim/custom" ~/.config/nvim/lua/custom
