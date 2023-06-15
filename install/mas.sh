#!/usr/bin/env bash

if ! is-macos -o ! is-executable brew; then
	echo "Skipped: Mac app store"
	return
fi

brew install mas

apps=(
	441258766 # Magnet
	562184107 # LanScan Pro
	497799835 # XCode
)

mas install "${apps[@]}"
