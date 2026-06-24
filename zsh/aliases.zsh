# This script file is used for alias

if [[ "$(command -v lsd)" ]]; then
  alias ls='lsd'
elif [[ "$(uname)" == "Darwin" ]]; then
  alias ls='ls -G'
elif [[ "$(uname)" == "Linux" ]]; then
  alias ls='ls --color=auto'
fi
alias ll='ls -lh'
alias la='ll -a'

alias gitlog='git log --graph --oneline --all --decorate'


