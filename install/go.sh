#!/bin/bash

if ! is-executable go; then
	echo "Skipping go dependencies"
	return
fi

go install github.com/bazelbuild/buildtools/buildifier@latest
go install github.com/editorconfig-checker/editorconfig-checker/cmd/editorconfig-checker@latest
