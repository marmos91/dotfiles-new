# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Aliases
source ~/.alias

# Environment
. "$HOME/.env"

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
    aws
    bazel
    brew
    gh
    fzf
    npm
    nvm
    tmux
    zsh-autosuggestions
    zsh-interactive-cd
    zsh-syntax-highlighting
)

# Load NVM only when needed to speed up boot time (https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/nvm#lazy-startup)
zstyle ':omz:plugins:nvm' lazy yes

source $ZSH/oh-my-zsh.sh

# User configuration

# Load Z environment
. $(brew --prefix)/etc/profile.d/z.sh

# Preferred editor
export EDITOR="nvim"

# Fuzzy finder
. "$HOME/.fzf"

# Node/NVM related stuff
nvm use --delete-prefix 16 --silent

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enable autocompletion
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # includes hidden files

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
