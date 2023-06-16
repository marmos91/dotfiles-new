#!/usr/bin/env bash

if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
	echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
	return
fi

if ! is-executable brew; then
	echo "Brew is missing. Installing it"
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	echo '# Set PATH, MANPATH, etc., for Homebrew.' >>~/.zprofile
	# shellcheck disable=2016
	echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>~/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv)"

fi

brew tap windmilleng/tap
brew tap cubbit/tap
brew tap bazelbuild/tap

brew update
brew upgrade

apps=(
	adobe-creative-cloud
	awscli
	bat
	ibazel
	bazelisk
	buildifier
	btop
	chafa
	clang-format
	commitlint
	cmake
	diff-so-fancy
	dockutil
	editorconfig-checker
	fd
	gh
	git-lfs
	golang
	go-task
	gpg
	ffmpeg
	fzf
	helm
	hub
	kubectl
	kubectx
	jq
	k9s
	lazygit
	lf
	luarocks
	luacheck
	mas
	neovim
	neofetch
	nvm
	ninja
	python
	python3
	ripgrep
	rclone
	thefuck
	tunnelblick
	tig
	tmux
	tldr
	tree
	youtube-dl
	yq
	wget
	windmilleng/tap/tilt
	z
)

"$(brew --prefix)/opt/fzf/install" --completion --key-bindings
# shellcheck disable=1091
source "$(brew --prefix nvm)/nvm.sh"

brew install "${apps[@]}"
