if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

# Install packages

apps=(
  authy
  bartender
  bettertouchtool
  cubbit
  docker
  flux
  google-chrome
  gpg-suite
  handbrake
  istat-menus
  iterm2
  jdownloader
  nordvpn
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

brew install --cask "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package
