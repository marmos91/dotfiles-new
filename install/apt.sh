#!/usr/bin/env bash

if ! is-linux -a is-executable sudo; then
	echo "Skipped: Apt"
	return
fi

sudo apt install -y gpg
sudo apt install -y software-properties-common

sudo apt update

export DEBIAN_FRONTEND=noninteractive
export DEBCONF_NONINTERACTIVE_SEEN=true

truncate -s0 /tmp/preseed.cfg
echo "tzdata tzdata/Areas select Europe" >>/tmp/preseed.cfg
echo "tzdata tzdata/Zones/Europe select Zurich" >>/tmp/preseed.cfg
debconf-set-selections /tmp/preseed.cfg &&
	rm -f /etc/timezone /etc/localtime

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
