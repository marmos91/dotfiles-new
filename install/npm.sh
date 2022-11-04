if ! is-executable brew -o ! is-executable git; then
  echo "Skipped: npm (missing: brew and/or git)"
  return
fi

if ! is-executable nvm; then
  echo "Skipped: nvm (already installed)"
  return
fi

if ! is-executable npm; then
  echo "Skipped: npm (already installed)"
  return
fi

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

nvm install 12

# Globally install with npm

packages=(
  commitizen
  node-cmake
  npm-check
  ts-node
  yarn
)

npm install -g "${packages[@]}"