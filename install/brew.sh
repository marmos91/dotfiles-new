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
brew tap jorgelbg/tap

brew update
brew upgrade

apps=(
	awscli
	bat
	bazelisk
	btop
	buildifier
	chafa
	clang-format
	cmake
	commitlint
	diff-so-fancy
	dockutil
	editorconfig-checker
	eza
	fd
	ffmpeg
	fzf
	gh
	git-lfs
	go-task
	golang
	gpg
	helm
	hub
	ibazel
	jq
	k9s
	kubectl
	kubectx
	lazygit
	lf
	llvm
	mas
	neofetch
	neovim
	ninja
	nvm
	pandoc
	pass
	pinentry-mac
	pinentry-touchid
	python
	python3
	rclone
	ripgrep
	swiftlint
	thefuck
	tig
	tldr
	tmux
	tmuxinator
	tree
	wget
	windmilleng/tap/tilt
	youtube-dl
	yq
	fish
)

"$(brew --prefix)/opt/fzf/install" --completion --key-bindings
# shellcheck disable=1091
source "$(brew --prefix nvm)/nvm.sh"

brew install "${apps[@]}"
