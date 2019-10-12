#!/usr/bin/env bash

# Author: Marco Moschettini
# Version: 1.0.0

function log
{
    echo "${BLUE}${UNDERLINE}$1${RESET}" 
}

function titlize
{
	echo "${YELLOW}$1${RESET}"
}

######## COLORS ########
YELLOW=`tput setaf 3`
BLUE=`tput setaf 4`
UNDERLINE=`tput smul`
RESET=`tput sgr0`
######## END COLORS ########

titlize "
    .___      __    _____.__.__                 
  __| _/_____/  |__/ ____\__|  |   ____   ______
 / __ |/  _ \   __\   __\|  |  | _/ __ \ /  ___/
/ /_/ (  <_> )  |  |  |  |  |  |_\  ___/ \___ \ 
\____ |\____/|__|  |__|  |__|____/\___  >____  >
     \/                               \/     \/ 
                                                                                                                                                                 
"

export DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export COMPUTER_NAME="Marco's MBP"

log "Dotfiles launched from $DOTFILES_DIR"

log "[0/10] Making dotfiles utils available"
PATH="$DOTFILES_DIR/bin:$PATH"
log "[✓] Dotfiles utils available"

log "[1/10] Creating dotfiles directory"
mkdir -p ~/.dotfiles
log "[✓] Dotfiles directory created"

log "[2/10] Installing Homebrew and command line utilites"
. "$DOTFILES_DIR/install/brew.sh"
log "[✓] Homebrew and command line utilites installed"

log "[3/10] Installing Homebrew cask and favorites applications"
. "$DOTFILES_DIR/install/brew-cask.sh"
log "[✓] Homebrew cask and favorites applications installed"

log "[4/10] Installing Mac app store applications"
. "$DOTFILES_DIR/install/mas.sh"
log "[✓] Mac app store applications installed"

log "[5/10] Installing fonts"
. "$DOTFILES_DIR/install/fonts.sh"
log "[✓] Fonts installed"

log "[6/10] Installing NodeJS"
. "$DOTFILES_DIR/install/npm.sh"
log "[✓] NodeJS installed"

log "[7/10] Installing Oh My Zsh"
. "$DOTFILES_DIR/install/zsh.sh"
log "[✓] Oh My Zsh installed"

log "[8/10] Setting OSX defaults"
. "$DOTFILES_DIR/macos/defaults.sh"
log "[✓] OSX defaults set"

log "[9/10] Setting OSX dock"
. "$DOTFILES_DIR/macos/dock.sh"
log "[✓] OSX dock set"

log "[10/10] Setting up dotfiles"
. "$DOTFILES_DIR/install/dotfiles.sh"
log "[✓] Dotfiles set"

log "[✓] Dotfiles installed: run the following command to load the new configuration"
echo "source ~/.zshrc"