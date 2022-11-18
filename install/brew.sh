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
brew tap go-task/tap
brew tap bazelbuild/tap

brew update
brew upgrade

apps=(
  adobe-creative-cloud
  awscli
  bat
  bazelbuild/tap/ibazel
  bazelisk
  buildifier
  clang-format
  cmake
  cubbit
  diff-so-fancy
  dockutil
  gh
  git-lfs
  golang
  go-task
  gpg
  ffmpeg
  fzf
  helm
  hub
  kubectl
  kubectx
  jq
  k9s
  lf
  mas
  ninja
  python
  python3
  rclone
  thefuck
  tig
  tmux
  tree
  vim
  youtube-dl
  yq
  wget
  windmilleng/tap/tilt
  z
)

$(brew --prefix)/opt/fzf/install --completion --key-bindings

brew install "${apps[@]}"
