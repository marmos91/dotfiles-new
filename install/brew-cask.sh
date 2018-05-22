if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap caskroom/cask
brew tap caskroom/fonts

# Install packages

apps=(
  alfred
  bettertouchtool
  boom-3d
  cleanmymac
  cyberduck
  docker
  dropbox
  flux
  go2shell
  google-chrome
  google-backup-and-sync
  handbrake
  image2icon
  iterm2
  jdownloader
  magnet
  parallels
  slack
  sketch
  skype
  sourcetree
  spotify
  tableplus
  telegram
  transmission
  visual-studio-code-insiders
  vlc
  whatsapp
)

brew cask install "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package