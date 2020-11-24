if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

if is-executable brew; then
  echo "Skipped: Homebrew already installed"
  return
fi

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew tap windmilleng/tap

brew update
brew upgrade

apps=(
  awscli
  diff-so-fancy
  dockutil
  gh
  git-lfs
  fzf
  hub
  kubectl
  jq
  k9s
  mas
  ninja
  python
  python3
  thefuck
  tig
  tmux
  tree
  vim
  wget
  windmilleng/tap/tilt
  z
)

$(brew --prefix)/opt/fzf/install --completion --key-bindings

brew install "${apps[@]}"
