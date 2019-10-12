if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

if is-executable brew; then
  echo "Skipped: Homebrew already installed"
  return
fi

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew update
brew upgrade

apps=(
  awscli
  diff-so-fancy
  dockutil
  git-flow
  git-lfs
  hub
  kubectl
  jq
  mas
  ninja
  python
  python3
  thefuck
  tig
  tree
  vim
  wget
  z
)

brew install "${apps[@]}"