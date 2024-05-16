# Tmux

set -e fish_tmux_default_session_name mac

if type -q nvm; and not type -q node
    nvm use 18 >/dev/null
end

# pnpm
set -gx PNPM_HOME /Users/marmos91/Library/pnpm
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
