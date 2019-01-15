#!/usr/bin/env bash

brew install bash  make git python python3 pipenv
brew install vim --with-override-system-vi

# zsh
brew install zsh
brew install zsh-completions
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Other useful tools
brew install httpie
brew install htop
