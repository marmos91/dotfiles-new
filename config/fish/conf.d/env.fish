set -gx DOTFILES_DIR "$HOME/.dotfiles"
set -gx OBSIDIAN_VAULTS_DIR "$HOME/vaults"

# Language
set -gx LANGUAGE en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LC_TYPE en_US.UTF-8

# GPG
set -gx GPG_TTY (tty)

set -gx HOMEBREW_NO_AUTO_UPDATE 1
