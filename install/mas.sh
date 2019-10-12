if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Mac app store"
  return
fi

brew install mas

apps=(
  409183694 # Keynote
  441258766 # Magnet
  409201541 # Pages
  562184107 # LanScan Pro
  # 497799835 # XCode
)

mas install "${apps[@]}"