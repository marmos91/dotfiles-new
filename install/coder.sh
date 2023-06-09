if ! is-macos -o ! is-executable curl -o; then
	echo "Cannot install coder related script"
	return
fi

curl -fsSL https://coder.com/install.sh | sh
