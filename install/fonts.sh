#!/usr/bin/env bash

if ! is-macos -o ! is-executable brew; then
	echo "Skipped: Homebrew-Cask"
	return
fi

brew tap shaunsingh/SFMono-Nerd-Font-Ligaturized

fonts=(
	font-fira-code-nerd-font
	font-jetbrains-mono-nerd-font
	font-meslo-lg-nerd-font
	font-sf-mono-nerd-font-ligaturized
)

brew install --cask "${fonts[@]}"
