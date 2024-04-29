
# System stuff
fish_add_path "$HOME/bin"
fish_add_path /usr/local/bin
fish_add_path /usr/local/sbin
fish_add_path "$HOME/.local/bin"

# Custom commands
fish_add_path "$DOTFILES_DIR/bin"

# Python stuff
fish_add_path "$HOME/.poetry"

# Go stuff
fish_add_path /usr/local/go/bin
fish_add_path "$GOPATH/bin"

# Rust stuff
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.rustup"

# Lua stuff
fish_add_path "$HOME/.luarocks/bin"
