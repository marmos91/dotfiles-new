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
	mv nvim-linux64/bin/* /usr/bin/
	mv nvim-linux64/lib/* /usr/lib/
	mv nvim-linux64/man/* /usr/man/
	mv nvim-linux64/share/* /usr/share/

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

if ! is-executable lazygit; then
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[0-9.]+')

	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"

	sudo tar xf lazygit.tar.gz -C /usr/bin lazygit

	rm -rf lazygit.tar.gz
else
	echo "Skipping lazygit"
fi
