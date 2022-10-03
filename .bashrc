eval "$(pyenv init -)"
eval "$(direnv hook bash)"
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
