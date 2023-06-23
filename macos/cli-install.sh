#!/usr/bin/env bash

if ! is-macos; then
	echo "Skipped: MacOS custom installations"
	return
fi

if ! directory-exists /Applications/Alacritty.app; then
	wget https://github.com/alacritty/alacritty/releases/download/v0.12.1/Alacritty-v0.12.1.dmg

	hdiutil mount Alacritty-v0.12.1.dmg

	sudo cp -R "/Volumes/Alacritty/Alacritty.app" /Applications

	hdiutil unmount "/Volumes/Alacritty/"

	rm Alacritty-v0.12.1.dmg
else
	echo "Alacritty already installed. Skipping"
fi
