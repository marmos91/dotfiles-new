#!/usr/bin/env bash

# Author: Marco Moschettini
# Version: 3.1.0

function log {
	echo "${BLUE}${UNDERLINE}$1${RESET}"
}

function titlize {
	echo "${YELLOW}$1${RESET}"
}

######## COLORS ########
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
UNDERLINE=$(tput smul)
RESET=$(tput sgr0)
######## END COLORS ########

titlize "
    .___      __    _____.__.__                 
  __| _/_____/  |__/ ____\__|  |   ____   ______
 / __ |/  _ \   __\   __\|  |  | _/ __ \ /  ___/
/ /_/ (  <_> )  |  |  |  |  |  |_\  ___/ \___ \ 
\____ |\____/|__|  |__|  |__|____/\___  >____  >
     \/                               \/     \/ 
                                                                                                                                                                 
"

# shellcheck disable=2155
export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export COMPUTER_NAME="nyarlathotep"

log "Dotfiles launched from $DOTFILES_DIR"

log "[0/14] Making dotfiles utils available"
PATH="$DOTFILES_DIR/bin:$PATH"
log "[✓] Dotfiles utils available"

log "[1/14] Creating dotfiles directory"
mkdir -p ~/.dotfiles
log "[✓] Dotfiles directory created"

log "[2/14] Installing Homebrew and command line utilites"
. "$DOTFILES_DIR/install/brew.sh"
log "[✓] Homebrew and command line utilites installed"

log "[3/14] Installing Homebrew cask and favorites applications"
. "$DOTFILES_DIR/install/brew-cask.sh"
log "[✓] Homebrew cask and favorites applications installed"

# log "[4/14] Installing Mac app store applications"
. "$DOTFILES_DIR/install/mas.sh"
log "[✓] Mac app store applications installed"

log "[5/14] Installing fonts"
. "$DOTFILES_DIR/install/fonts.sh"
log "[✓] Fonts installed"

log "[6/14] Installing NodeJS"
. "$DOTFILES_DIR/install/npm.sh"
log "[✓] NodeJS installed"

log "[7/14] Installing Oh My Zsh"
. "$DOTFILES_DIR/install/zsh.sh"
log "[✓] Oh My Zsh installed"

log "[8/14] Setting OSX defaults"
. "$DOTFILES_DIR/macos/defaults.sh"
log "[✓] OSX defaults set"

log "[9/14] Setting OSX dock"
. "$DOTFILES_DIR/macos/dock.sh"
log "[✓] OSX dock set"

log "[10/14] Setting up dotfiles"
. "$DOTFILES_DIR/install/dotfiles.sh"
log "[✓] Dotfiles set"

log "[11/14] Installing Config related stuff"
. "$DOTFILES_DIR/install/config.sh"
log "[✓] Config installed"

log "[12/14] Installing Tmux related stuff"
. "$DOTFILES_DIR/install/tmux.sh"
log "[✓] Tmux installed"

log "[13/14] Installing coder related script"
. "$DOTFILES_DIR/install/coder.sh"
log "[✓] Coder installed"

log "[14/14] Installing Karabiner related script"
. "$DOTFILES_DIR/install/karabiner.sh"
log "[✓] Karabiner installed"

log "[✓] Dotfiles installed: run the following command to load the new configuration"
echo "source ~/.zshrc"
