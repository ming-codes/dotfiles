DISABLE_AUTO_UPDATE=true

plugins=(git history-substring-search vi-mode)

# Raise file descriptor limit
ulimit -n 8192

source $DOTFILES/shell/promptline.sh
source $ZSH/oh-my-zsh.sh             # FIXME This is second slow

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

echo "Welcome to ZSH"

alias vim="nvim"
alias vi="nvim"
alias ll="ls -l"
alias f="fuck"

eval $(thefuck --alias)

if [ -z "$SSH_AUTH_SOCK" ]; then
  eval $(ssh-agent)
  ssh-add
fi

export VOLTA_HOME="/Users/minliu/.volta"
grep --silent "$VOLTA_HOME/bin" <<< $PATH || export PATH="$VOLTA_HOME/bin:$PATH"

# This needs to be the last line
eval "$(direnv hook zsh)"
