export DOTFILES=$HOME/.dotfiles
export ZSH=$DOTFILES/zsh/oh-my-zsh
export FZF_DEFAULT_OPTS="-m"

export LDFLAGS="-L/usr/local/opt/curl-openssl/lib"
export CPPFLAGS="-I/usr/local/opt/curl-openssl/include"

#export LDFLAGS="-L/usr/local/opt/curl-openssl/lib -L/usr/local/opt/openssl/lib"
#export CPPFLAGS="-I/usr/local/opt/curl-openssl/include -I/usr/local/opt/openssl/include"

DISABLE_AUTO_UPDATE=true

plugins=(git history-substring-search vi-mode)

# Raise file descriptor limit
ulimit -n 8192

for ruby in `find ~/.gem/ruby -type d -maxdepth 2 | grep 'bin$'`
do
  export PATH=$ruby:$PATH
done

export PATH="/usr/local/opt/curl-openssl/bin:$PATH"

#for py in `find ~/Library/Python -type d -maxdepth 2 | grep 'bin$'`
#do
#  export PATH=$py:$PATH
#done

export PATH=$DOTFILES/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

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

export VOLTA_HOME="$HOME/.volta"
[ -s "$VOLTA_HOME/load.sh" ] && . "$VOLTA_HOME/load.sh"

export PATH="$VOLTA_HOME/bin:$PATH"

if [ -z "$SSH_AUTH_SOCK" ]; then
  eval $(ssh-agent)
  ssh-add
fi
