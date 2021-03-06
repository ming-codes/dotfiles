DISABLE_AUTO_UPDATE=true

plugins=(history-substring-search vi-mode)

# Raise file descriptor limit
ulimit -n 8192

source $DOTFILES/shell/promptline.sh     # 7ms
source $ZSH/oh-my-zsh.sh                 # 122ms FIXME This is second slow

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh   # 11ms

echo "Welcome to ZSH"

alias vim="nvim"
alias vi="nvim"
alias ll="ls -l"

if [ -z "$SSH_AUTH_SOCK" ]; then
  eval $(ssh-agent)
  ssh-add
fi



# This needs to be the last line
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
