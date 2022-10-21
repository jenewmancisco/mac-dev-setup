# Add Homebrew new `/opt/homebrew/bin`` & old`/usr/local/bin`, '/usr/local/sbin' and User`~/bin`to the`$PATH`
PATH=/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:$PATH
PATH=$HOME/bin:$PATH
export PATH

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,bash_prompt,exports,aliases,functions,extra,bashrc}; do
  [ -r "$file" ] && source "$file"
done
unset file

# bash-completion
if [ -f $(brew --prefix)/etc/profile.d/bash_completion.sh ]; then
  . $(brew --prefix)/etc/profile.d/bash_completion.sh
fi
