#!/usr/bin/env bash

if ! is-linux -a is-executable sudo; then
	echo "Skipped: Apt"
	return
fi

sudo apt install -y gpg
sudo apt install -y software-properties-common

sudo apt update

apps=(
	awscli
	bat
	btop
	chafa
	curl
	clang-format
	exa
	fd-find
	fzf
	gh
	git-lfs
	golang
	hub
	jq
	luarocks
	neofetch
	python2
	python3
	ripgrep
	rclone
	tmux
	tldr
	wget
	unzip
	zsh
)

sudo apt install -y "${apps[@]}"
