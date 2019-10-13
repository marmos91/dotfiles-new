if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

# Install packages

apps=(
  authy
  bartender
  bettertouchtool
  cleanmymac
  docker
  flux
  go2shell
  google-chrome
  google-backup-and-sync
  gpg-suite
  handbrake
  istat-menus
  iterm2
  jdownloader
  minikube
  postman
  slack
  spotify
  tableplus
  telegram
  the-unarchiver
  transmission
  tripmode
  visual-studio-code
  virtualbox
  vlc
  whatsapp
  yarn
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package