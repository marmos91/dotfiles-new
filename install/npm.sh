#!/usr/bin/env bash

if ! is-executable nvm; then
	echo "Skipped: nvm (already installed)"
	return
fi

if ! is-executable npm; then
	echo "Skipped: npm (already installed)"
	return
fi

nvm install 16
nvm use 16

# Globally install with npm

packages=(
	commitizen
	@commitlint/{config-conventional,cli}
	@compodoc/live-server
	commitlint-format-json
	npm-check
	prettier-eslint-cli
)

npm install -g "${packages[@]}"
