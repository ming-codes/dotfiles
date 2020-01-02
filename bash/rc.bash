
DOTFILES=~/.dotfiles
BASH_IT=$DOTFILES/bash/bash-it

# Raise file descriptor limit
ulimit -n 8192

set -o vi

source $DOTFILES/shell/promptline.sh
source $BASH_IT/bash_it.sh
source $HOME/.nvm/nvm.sh

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

echo "Welcome to BASH"

alias vim="nvim"
alias vi="nvim"
alias ll="ls -l"
alias f="fuck"

eval $(thefuck --alias)

# This needs to be the last line
eval "$(direnv hook bash)"

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export VOLTA_HOME="$HOME/.volta"
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"

export PATH="$VOLTA_HOME/bin:$PATH"