alias g hub
alias gg lazygit
alias top btop
alias python python3
alias pinentry pinentry-mac
alias cat bat

if type -q eza
    alias ls eza
    alias ll "eza -l -g --icons"
    alias la "ll -a"
end

# Go inside Obsidian Vault dir
alias oo "cd $OBSIDIAN_VAULTS_DIR"
