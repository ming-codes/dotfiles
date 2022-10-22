#!/usr/bin/env sh

mkdir -p ~/.ssh
touch ~/.ssh/config

if [[ -z $(grep "Include keychain_config" "$HOME/.ssh/config") ]];
then
  echo "" >> $HOME/.ssh/config
  echo "Include keychain_config" >> $HOME/.ssh/config
fi
