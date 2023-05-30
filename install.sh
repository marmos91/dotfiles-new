#!/usr/bin/env bash

# Author: Marco Moschettini
# Version: 2.1.0

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

log "[0/12] Making dotfiles utils available"
PATH="$DOTFILES_DIR/bin:$PATH"
log "[✓] Dotfiles utils available"

log "[1/12] Creating dotfiles directory"
mkdir -p ~/.dotfiles
log "[✓] Dotfiles directory created"

log "[2/12] Installing Homebrew and command line utilites"
. "$DOTFILES_DIR/install/brew.sh"
log "[✓] Homebrew and command line utilites installed"

log "[3/12] Installing Homebrew cask and favorites applications"
. "$DOTFILES_DIR/install/brew-cask.sh"
log "[✓] Homebrew cask and favorites applications installed"

log "[4/12] Installing Mac app store applications"
. "$DOTFILES_DIR/install/mas.sh"
log "[✓] Mac app store applications installed"

log "[5/12] Installing fonts"
. "$DOTFILES_DIR/install/fonts.sh"
log "[✓] Fonts installed"

log "[6/12] Installing NodeJS"
. "$DOTFILES_DIR/install/npm.sh"
log "[✓] NodeJS installed"

log "[7/12] Installing Oh My Zsh"
. "$DOTFILES_DIR/install/zsh.sh"
log "[✓] Oh My Zsh installed"

log "[8/12] Setting OSX defaults"
. "$DOTFILES_DIR/macos/defaults.sh"
log "[✓] OSX defaults set"

log "[9/12] Setting OSX dock"
# . "$DOTFILES_DIR/macos/dock.sh"
log "[✓] OSX dock set"

log "[10/12] Setting up dotfiles"
. "$DOTFILES_DIR/install/dotfiles.sh"
log "[✓] Dotfiles set"

log "[11/12] Installing NeoVim related stuff"
. "$DOTFILES_DIR/install/nvim.sh"
log "[✓] NeoVim installed"

log "[12/12] Installing Tmux related stuff"
. "$DOTFILES_DIR/install/tmux.sh"
log "[✓] Tmux installed"

log "[13/12] Installing Vale related stuff"
. "$DOTFILES_DIR/install/vale.sh"
log "[✓] Vale installed"

log "[14/12] Installing coder related script"
. "$DOTFILES_DIR/install/coder.sh"
log "[✓] Coder installed"

log "[✓] Dotfiles installed: run the following command to load the new configuration"
echo "source ~/.zshrc"
