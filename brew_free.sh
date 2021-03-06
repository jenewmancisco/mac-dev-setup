#!/usr/bin/env bash

brew install bash  make git python@2 python3 pipenv
brew install bash-completion@2
brew install vim --with-override-system-vi
brew install git-lfs
brew install jq

#Node.js - JavaScript-based environment used to create web-servers and networked applications.
# NPM is a “package manager” that makes installing Node “packages” fast and easy. 
#   A package, also called a module, is just a code library that extends Node by adding useful features.
# NPM is installed when you install Node.js
# Test Node. To see if Node is installed, type `node -v`
# Test NPM. To see if NPM is installed, type `npm -v`
brew install node

# zsh
#brew install zsh
#brew install zsh-completions
#sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Other useful tools
brew install httpie
brew install htop
