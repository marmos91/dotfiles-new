if ! is-macos -o ! is-executable brew; then
	echo "Skipped: Homebrew-Cask"
	return
fi

# Install packages

apps=(
	1password
	authy
	bartender
	bettertouchtool
	cleanmymac
	cubbit
	docker
	dropbox
	epic-games
	flux
	# google-chrome
	# gdrive
	gpg-suite
	handbrake
	istat-menus
	iterm2
	# jdownloader
	logitech-options
	nordvpn
	obs
	postman
	slack
	spotify
	tableplus
	# telegram
	the-unarchiver
	teamviewer
	# transmission
	tripmode
	visual-studio-code-insiders
	vlc
	whatsapp
	zoom
)

brew install --cask "${apps[@]}"

# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
# brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv qlimagesize webpquicklook suspicious-package
