# Disable annoying greeting
set fish_greeting "Hello from Fish"

set -gx TERM xterm-256color

# Aliases
alias g hub

# Editor
abbr vim nvim
abbr vi nvim
abbr v nvim

set -gx EDITOR (which nvim)
set -gx VISUAL $EDITOR
set -gx SUDO_EDITOR $EDITOR
set -gx DOTFILES_DIR "$HOME/.dotfiles"

# Cursor styles
set -gx fish_vi_force_cursor 1
set -gx fish_cursor_default block
set -gx fish_cursor_insert line blink
set -gx fish_cursor_visual block
set -gx fish_cursor_replace_one underscore

# Exports
set -x HOMEBREW_NO_AUTO_UPDATE 1

if type -q eza
    alias ll "eza -l -g --icons"
    alias lla "ll -a"
end

# Theme
# set -g theme_nerd_fonts yes
# set -g theme_color_scheme dark

# Strap Fisher up in case we haven't installed our plugins
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
