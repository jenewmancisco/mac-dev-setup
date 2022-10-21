eval "$(pyenv init -)"
eval "$(direnv hook bash)"
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
