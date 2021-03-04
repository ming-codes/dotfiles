
DOTFILES=~/.dotfiles
BASH_IT=$DOTFILES/bash/bash-it

# Raise file descriptor limit
ulimit -n 8192

set -o vi

source $DOTFILES/shell/promptline.sh
source $BASH_IT/bash_it.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

echo "Welcome to BASH"

alias vim="nvim"
alias vi="nvim"
alias ll="ls -l"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# This needs to be the last line
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
