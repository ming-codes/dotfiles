#!/usr/bin/env sh

eval "$(/opt/homebrew/bin/brew shellenv)"

brew bundle --no-lock --file=/dev/stdin <<EOF
brew "gpg"
EOF

# FIXME gpg not in $PATH
eval "$(/opt/homebrew/bin/brew shellenv)"

#gpg --decrypt $CHEZMOI_WORKING_TREE/.encryption/gpg.public | gpg --import
gpg --decrypt $CHEZMOI_WORKING_TREE/.encryption/gpg.secret | gpg --import
