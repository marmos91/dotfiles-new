#!/usr/bin/env bash

if ! is-macos -o ! is-executable brew; then
	echo "Skipped: Homebrew-Cask"
	return
fi

brew tap homebrew/cask-fonts

fonts=(
	font-fira-code-nerd-font
	font-jetbrains-mono-nerd-font
)

brew install --cask "${fonts[@]}"
