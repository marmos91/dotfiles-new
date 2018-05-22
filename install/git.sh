if ! is-executable brew -o ! is-executable git; then
  echo "Skipped: npm (missing: brew and/or git)"
  return
fi

brew update

apps=(
    git-flow
    hub
    git-lfs
)

brew install "${apps[@]}"