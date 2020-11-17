if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

# Install packages

apps=(
  authy
  bartender
  bettertouchtool
  docker
  flux
  google-chrome
  google-backup-and-sync
  handbrake
  istat-menus
  iterm2
  jdownloader
  postman
  slack
  spotify
  tableplus
  # telegram
  the-unarchiver
  transmission
  tripmode
  visual-studio-code
  vlc
  whatsapp
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package
