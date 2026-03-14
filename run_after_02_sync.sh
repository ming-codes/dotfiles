#!/usr/bin/env sh

eval "$(/opt/homebrew/bin/brew shellenv)"

brew bundle --global

mackup restore -f

skillshare sync
