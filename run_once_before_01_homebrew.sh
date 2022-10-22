#!/usr/bin/env sh

if ! command -v brew &> /dev/null;
then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

eval "$(/opt/homebrew/bin/brew shellenv)"

# xcode-select -p || xcode --select
