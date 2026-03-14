#!/usr/bin/env sh

eval "$(/opt/homebrew/bin/brew shellenv)"

mackup restore -f

skillshare sync
