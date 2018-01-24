
export DOTFILES=$HOME/.dotfiles
export ZSH=$DOTFILES/zsh/oh-my-zsh
export FZF_DEFAULT_OPTS="-m"

DISABLE_AUTO_UPDATE=true

plugins=(git history-substring-search vi-mode)

# Raise file descriptor limit
ulimit -n 8192

export PATH=$DOTFILES/bin:$PATH

for ruby in `find ~/.gem/ruby -type d -maxdepth 2 | grep 'bin$'`
do
  export PATH=$ruby:$PATH
done

#for py in `find ~/Library/Python -type d -maxdepth 2 | grep 'bin$'`
#do
#  export PATH=$py:$PATH
#done

source $DOTFILES/shell/promptline.sh
source $ZSH/oh-my-zsh.sh
source $HOME/.nvm/nvm.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

echo "Welcome to ZSH"

alias vim="nvim"
alias vi="nvim"
alias ll="ls -l"
alias f="fuck"

eval $(thefuck --alias)

# This needs to be the last line
eval "$(direnv hook zsh)"

# This loads nvm bash_completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 
