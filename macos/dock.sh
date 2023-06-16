#!/usr/bin/env bash

if ! is-macos; then
	echo "Skipped: OSX dock"
	return
fi

dockutil --no-restart --remove all
dockutil --no-restart --add --replacing "/Applications/Google Chrome.app"
dockutil --no-restart --add --replacing "/Applications/Mail.app"
dockutil --no-restart --add --replacing "/Applications/WhatsApp.app"
dockutil --no-restart --add --replacing "/Applications/Messages.app"
dockutil --no-restart --add --replacing "/Applications/Telegram.app"
dockutil --no-restart --add --replacing "/Applications/Slack.app"
dockutil --no-restart --add --replacing "/Applications/Spotify.app"

defaults write com.apple.dock show-recents -bool FALSE

dockutil --add '/Applications' --view grid --display folder --allhomes
dockutil --add "$HOME/Downloads" --view grid --display folder --allhomes

killall Dock
