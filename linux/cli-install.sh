#!/usr/bin/env bash

if ! is-linux; then
	echo "Skipped: Linux custom installations"
	return
fi

if ! is-executable nvim; then
	wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz
	wget https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz.sha256sum

	sha256sum -c nvim-linux64.tar.gz.sha256sum

	tar xzvf nvim-linux64.tar.gz
	sudo mv nvim-linux64/bin/* /usr/bin/
	sudo mv nvim-linux64/lib/* /usr/lib/
	sudo mv nvim-linux64/man/* /usr/man/
	sudo mv nvim-linux64/share/* /usr/share/

	rm ./nvim-linux64.tar.gz
	rm ./nvim-linux64.tar.gz.sha256sum
	rm -rf nvim-linux64
else
	echo "Skipping NVim installation"
fi

if ! is-executable z; then
	curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
else
	echo "Skipping zoxide"
fi

if ! is-executable nvm; then
	curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
else
	echo "Skipping nvm"
fi

if ! is-executable bazelisk; then
	wget https://github.com/bazelbuild/bazelisk/releases/download/v1.17.0/bazelisk-linux-amd64
	chmod +x bazelisk-linux-amd64
	sudo mv bazelisk-linux-amd64 /usr/bin/bazelisk
else
	echo "Skipping bazelisk"
fi

if ! is-executable luacheck -a is-executable luarocks; then
	luarocks install luacheck
else
	echo "Skipping luacheck"
fi

if ! is-executable lazygit; then
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

	sudo tar xf lazygit.tar.gz -C /usr/bin lazygit

	rm -rf lazygit.tar.gz
else
	echo "Skipping lazygit"
fi
