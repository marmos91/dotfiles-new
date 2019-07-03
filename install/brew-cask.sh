if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap caskroom/cask
brew tap caskroom/fonts

# Install packages

apps=(
  authy
  bartender
  bettertouchtool
  docker
  dropbox
  flux
  go2shell
  google-chrome
  google-backup-and-sync
  gpg-suite
  handbrake
  istat-menus
  iterm2
  jdownloader
  slack
  sketch
  skype
  sourcetree
  spotify
  tableplus
  telegram
  the-unarchiver
  transmission
  visual-studio-code
  vlc
  whatsapp
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package