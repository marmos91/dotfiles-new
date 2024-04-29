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
export COMPUTER_NAME="amaterasu"

log "Dotfiles launched from $DOTFILES_DIR"

log "[0/18] Making dotfiles utils available"
PATH="$DOTFILES_DIR/bin:$PATH"
log "[✓] Dotfiles utils available"

log "[1/18] Creating dotfiles directory"
mkdir -p ~/.dotfiles
log "[✓] Dotfiles directory created"

log "[2/18] Installing Apt and command line utilites"
. "$DOTFILES_DIR/install/apt.sh"
log "[✓] Apt and command line utilites installed"

log "[3/18] Installing Homebrew and command line utilites"
. "$DOTFILES_DIR/install/brew.sh"
log "[✓] Homebrew and command line utilites installed"

log "[4/18] Installing Homebrew cask and favorites applications"
. "$DOTFILES_DIR/install/brew-cask.sh"
log "[✓] Homebrew cask and favorites applications installed"

log "[5/18] Installing Mac app store applications"
. "$DOTFILES_DIR/install/mas.sh"
log "[✓] Mac app store applications installed"

log "[6/18] Installing fonts"
. "$DOTFILES_DIR/install/fonts.sh"
log "[✓] Fonts installed"

log "[7/18] Installing NodeJS"
. "$DOTFILES_DIR/install/npm.sh"
log "[✓] NodeJS installed"

log "[9/18] Setting OSX defaults"
. "$DOTFILES_DIR/macos/defaults.sh"
log "[✓] OSX defaults set"

log "[10/18] Setting OSX dock"
. "$DOTFILES_DIR/macos/dock.sh"
log "[✓] OSX dock set"

log "[11/18] Setting up dotfiles"
. "$DOTFILES_DIR/install/dotfiles.sh"
log "[✓] Dotfiles set"

log "[12/18] Installing Config related stuff"
. "$DOTFILES_DIR/install/config.sh"
log "[✓] Config installed"

log "[13/18] Installing Tmux related stuff"
. "$DOTFILES_DIR/install/tmux.sh"
log "[✓] Tmux installed"

log "[14/18] Installing coder related script"
. "$DOTFILES_DIR/install/coder.sh"
log "[✓] Coder installed"

log "[15/18] Installing go related stuff"
. "$DOTFILES_DIR/install/go.sh"
log "[✓] Coder installed"

log "[16/18] Installing Linux related stuff"
. "$DOTFILES_DIR/linux/cli-install.sh"
log "[✓] Linux stuff installed"

log "[17/18] Installing MacOS related stuff"
. "$DOTFILES_DIR/macos/cli-install.sh"
log "[✓] Linux stuff installed"

log "[✓] Dotfiles installed: run the following command to load the new configuration"

sudo sh -c 'echo /opt/homebrew/bin/fish >> /etc/shells'
chsh -s /opt/homebrew/bin/fish
fish -c "fish_add_path /opt/homebrew/bin"
