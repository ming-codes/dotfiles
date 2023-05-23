#!/usr/bin/env sh

mkdir -p ~/.ssh
touch ~/.ssh/config

if [[ -z $(grep "Include keychain_config" "$HOME/.ssh/config") ]]; then
  echo "" >> $HOME/.ssh/config
  echo "Include keychain_config" >> $HOME/.ssh/config
fi

git config core.sshCommand "ssh -F ~/.ssh/ming-codes_config"
git config user.email "ming.codes@gmail.com"
