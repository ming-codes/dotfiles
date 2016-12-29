
export DOTFILES=$HOME/.dotfiles
export ZSH=$DOTFILES/zsh/oh-my-zsh

DISABLE_AUTO_UPDATE=true

plugins=(git history-substring-search vi-mode)

# Raise file descriptor limit
ulimit -n 8192

alias vim="nvim"
alias vi="nvim"
alias ll="ls -l"

export PATH=$DOTFILES/bin:$PATH

for ruby in `find ~/.gem/ruby -type d -maxdepth 2 | grep 'bin$'`
do
  export PATH=$ruby:$PATH
done

source $DOTFILES/shell/promptline.sh
source $ZSH/oh-my-zsh.sh
source $HOME/.nvm/nvm.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

echo "Welcome to ZSH"

# This needs to be the last line
eval "$(direnv hook zsh)"
