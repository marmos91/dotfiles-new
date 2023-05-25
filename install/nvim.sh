if ! is-macos -o ! is-executable brew; then
  echo "Skipped: NVim"
  return
fi

brew install neovim

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

cp -a "$DOTFILES_DIR/nvim/custom/" ~/.config/nvim/custom