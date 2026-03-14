#!/usr/bin/env sh

eval "$(/opt/homebrew/bin/brew shellenv)"

brew upgrade
opencode upgrade
bun upgrade

skillshare sync
