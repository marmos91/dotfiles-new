if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Zsh"
  return
fi

brew install zsh

# Installing oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k