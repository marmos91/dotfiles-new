if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap homebrew/cask-fonts

fonts=(
  font-fira-code
)

cp "$DOTFILES_DIR/fonts/SourceCodePro+Powerline+Awesome+Regular.ttf" ~/Library/Fonts

brew cask install "${fonts[@]}"