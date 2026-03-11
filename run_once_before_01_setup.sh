#!/usr/bin/env sh

xcode-select --install                                                                          # Install Xcode Command Line Tools
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" # Install Homebrew
curl -fsSL https://opencode.ai/install | bash                                                   # Install OpenCode
curl -fsSL https://astral.sh/uv/install.sh | sh                                                 # Install UV
curl -fsSL https://raw.githubusercontent.com/runkids/skillshare/main/install.sh | sh            # Install skillshare
