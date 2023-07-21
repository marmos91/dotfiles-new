#!/usr/bin/env bash

if ! is-macos; then
	echo "Skipped: OSX dock"
	return
fi

dockutil --no-restart --remove all
dockutil --no-restart --add "/Applications/Google Chrome.app"
dockutil --no-restart --add "/Applications/Mail.app"
dockutil --no-restart --add "/Applications/WhatsApp.app"
dockutil --no-restart --add "/Applications/Messages.app"
dockutil --no-restart --add "/Applications/Telegram.app"
dockutil --no-restart --add "/Applications/Slack.app"
dockutil --no-restart --add "/Applications/Alacritty.app"
dockutil --no-restart --add "/Applications/Spotify.app"

defaults write com.apple.dock show-recents -bool FALSE
defaults write com.apple.dock orientation left
defaults write com.apple.dock tilesize -integer 39
defaults write com.apple.Dock autohide -bool TRUE

dockutil --add '/Applications' --view grid --display folder --allhomes
dockutil --add "$HOME/Downloads" --view grid --display folder --allhomes

killall Dock
