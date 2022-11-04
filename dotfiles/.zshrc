# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Environment
export DOTFILES_DIR="$HOME/.dotfiles"
. "$DOTFILES_DIR"/.env

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  fast-syntax-highlighting
  fzf
	zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-autocomplete
)

# NVM plugin conf
NVM_AUTOLOAD=1

source $ZSH/oh-my-zsh.sh

# User configuration

# Aliases
source ~/.dotfiles/.alias

# Load Z environment
. $(brew --prefix)/etc/profile.d/z.sh

# Preferred editor
export EDITOR="vim"

# Vim stuff
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Node/NVM related stuff
export NVM_DIR="/Users/$USER/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

nvm use --delete-prefix 16 --silent

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enable autoload
autoload -Uz compinit && compinit
