#!/usr/bin/env bash

if ! is-macos -o ! is-executable curl; then
	echo "Skipped: Kitty (missing: curl)"
	return
fi

curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
