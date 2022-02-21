if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi

if ! is-executable brew; then
  echo "Brew is missing. Installing it"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

brew tap windmilleng/tap
brew tap cubbit/tap
brew tap homebrew/cask-drivers

brew update
brew upgrade

apps=(
  awscli
  bazelisk
  buildifier
  clang-format
  cubbit
  dockutil
  gh
  git-lfs
  go-task/tap/go-task
  gpg
  ffmpeg
  fzf
  hub
  kubectl
  kubectx
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
  youtube-dl
  wget
  windmilleng/tap/tilt
  z
)

$(brew --prefix)/opt/fzf/install --completion --key-bindings

brew install "${apps[@]}"
