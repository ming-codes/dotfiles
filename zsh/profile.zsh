export DOTFILES=$HOME/.dotfiles
export ZSH=$DOTFILES/zsh/oh-my-zsh
export FZF_DEFAULT_OPTS="-m"

export LDFLAGS="-L/usr/local/opt/curl-openssl/lib"
export CPPFLAGS="-I/usr/local/opt/curl-openssl/include"

#export LDFLAGS="-L/usr/local/opt/curl-openssl/lib -L/usr/local/opt/openssl/lib"
#export CPPFLAGS="-I/usr/local/opt/curl-openssl/include -I/usr/local/opt/openssl/include"

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
