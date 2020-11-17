if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap homebrew/cask-fonts

fonts=(
  font-fira-code
)

git clone https://github.com/powerline/fonts.git "$DOTFILES_DIR/fonts/powerline" --depth=1
$DOTFILES_DIR/fonts/powerline/install.sh
rm -rf $DOTFILES_DIR/fonts/powerline

cp "$DOTFILES_DIR/fonts/SourceCodePro+Powerline+Awesome+Regular.ttf" ~/Library/Fonts

brew cask install "${fonts[@]}"