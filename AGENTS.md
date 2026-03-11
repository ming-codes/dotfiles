# AGENTS.md

This repo contains [chezmoi](https://www.chezmoi.io) configuration for my dotfiles.

Most files are sync'd to home directory via chezmoi.

Tools are managed by many toolchain managers:

- brew
- uv
- mise
- skillshare
- mackup
- tinty

## Sync

Changes to config files should be sync'd back to `chezmoi` via `chezmoi add` command.

Specifically, these files must be sync'd:

- ~/.profile
- ~/.zprofile
- ~/.zshrc
- ~/.gitconfig
- ~/.config/nvim/
- ~/.config/tmux/
- ~/.config/kitty/
- ~/.config/mackup/
- ~/.claude/CLAUDE.md
- ~/AGENTS.md
