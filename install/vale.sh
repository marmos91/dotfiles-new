if ! is-macos -o ! is-executable vale; then
  echo "Skipped: Vale"
  return
fi

mkdir -p ~/.vale

ln -sfv "$DOTFILES_DIR/dotfiles/.vale.ini" ~
cp -a "$DOTFILES_DIR/vale/" ~/.vale/

vale --config ~/.vale.ini sync
