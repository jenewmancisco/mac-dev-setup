#!/usr/bin/env bash


brew install bash  make git python@2 python3 pipenv helm
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

# direnv - load environment variables, depending on the current directory
# pyenv - change Python versions on a per-project basis
# together give a higher level of control on the version used in directory
# pyenv will try its best to download and compile the wanted Python version
#  Below recommendations for system dependencies for a sane build environment
brew install openssl readline sqlite3 xz zlib tcl-tk
brew install pyenv
# configuring your shell
# echo 'export PATH="~/.pyenv/bin:$PATH"' >> ~/.bashrc
# echo 'eval "$(pyenv init -)"' >> ~/.bashrc
# echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc


# BASH Shell Scripting
brew install shellcheck

# You can upgrade them with 
# brew upgrade
# or list them with 
# brew outdated

# To force the link and overwrite all conflicting files:
#  brew link --overwrite argo
#
#To list all files that would be deleted:
#  brew link --overwrite --dry-run argo
