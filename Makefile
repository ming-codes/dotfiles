OS:=$(shell uname -s)

.PHONY: brew-install

mas-install:
	mas install 413857545  # Divvy
	mas install 587512244  # Kaleidoscope
	mas install 407963104  # Pixelmator
	mas install 1362171212 # Caffeinated

brew-install:
ifeq ($(OS),Darwin)
	brew tap caskroom/cask
	brew install mas
	brew install trash
endif
	brew install tmux
	brew link tmux
	brew install fish
	brew install zsh
	brew install neovim
	brew install git
	brew install curl-openssl
	brew install tree
	brew install ack
	brew install wget
	brew install jq
	brew install rename
	brew install coreutils
	brew install watchman

cask-install:
ifeq ($(OS),Darwin)
	brew cask install --appdir=~/Applications alfred
	brew cask install --appdir=~/Applications dash
	brew cask install --appdir=~/Applications slack
	brew cask install --appdir=~/Applications brave-browser
	brew cask install --appdir=~/Applications iterm2
	brew cask install --appdir=~/Applications java
	brew cask install --appdir=~/Applications eclipse-jee
endif

gem-install:
	gem install --user-install git-up

vim-install:
	nvim -c 'PlugInstall' -c 'xa'

curl-install:
	curl https://get.volta.sh | bash

volta-install:
	~/.volta/volta install yarn
	~/.volta/volta install node

link:
	mkdir -p ~/.config/nvim/autoload
	mkdir -p ~/.config/nvim/vim-backup
	mkdir -p ~/.config/nvim/vim-swap
	mkdir -p ~/.config/nvim/vim-undo
	mkdir -p ~/.ssh

	ln -s ~/.dotfiles/nvim/autoload/plug.vim    ~/.config/nvim/autoload/plug.vim
	ln -s ~/.dotfiles/nvim/init.vim             ~/.config/nvim/init.vim
	ln -s ~/.dotfiles/nvim/appearance.vim       ~/.config/nvim/appearance.vim
	ln -s ~/.dotfiles/nvim/mappings.vim         ~/.config/nvim/mappings.vim
	ln -s ~/.dotfiles/nvim/plugins.vim          ~/.config/nvim/plugins.vim
	ln -s ~/.dotfiles/nvim/settings.vim         ~/.config/nvim/settings.vim

	mkdir -p ~/.config/fish

	ln -s ~/.dotfiles/fish/config.fish     ~/.config/fish/config.fish

	ln -s ~/.dotfiles/zsh/rc.zsh           ~/.zshrc
	ln -s ~/.dotfiles/zsh/profile.zsh      ~/.zprofile
	ln -s ~/.dotfiles/bash/rc.bash         ~/.bashrc
	ln -s ~/.dotfiles/bash/profile.bash    ~/.bash_profile

	ln -s ~/.dotfiles/editorconfig         ~/.editorconfig
	ln -s ~/.dotfiles/gitconfig            ~/.gitconfig
	ln -s ~/.dotfiles/gemrc                ~/.gemrc
	ln -s ~/.dotfiles/tmuxconf             ~/.tmux.conf

install: brew-install curl-install volta-install cask-install mas-install unlink link gem-install vim-install

unlink:
	-unlink ~/.config/nvim/init.vim
	-unlink ~/.config/nvim/autoload/plug.vim
	-unlink ~/.config/nvim/appearance.vim
	-unlink ~/.config/nvim/mappings.vim
	-unlink ~/.config/nvim/plugins.vim
	-unlink ~/.config/nvim/settings.vim
	-unlink ~/.config/fish/config.fish
	-unlink ~/.zshrc
	-unlink ~/.zprofile
	-unlink ~/.bashrc
	-unlink ~/.bash_profile
	-unlink ~/.editorconfig
	-unlink ~/.gitconfig
	-unlink ~/.tmux.conf
	-unlink ~/.gemrc
ifeq ($(OS),Darwin)
	-unlink ~/Library/Application\ Support/Alfred\ 2/Alfred.alfredpreferences
	-unlink /Applications/iOS\ Simulator.app
endif

uninstall:
	-unlink ~/.fzf

clean: unlink
	-brew untap phinze/cask
	-brew untap caskroom/cask
	-brew update
	-brew cleanup
	-brew cask cleanup
	-trash -s

update:
	git checkout master
	git pull --rebase origin master --tags
	-sh ./zsh/oh-my-zsh/tools/upgrade.sh
	brew update
ifeq ($(OS),Darwin)
	-brew upgrade mas
endif
	-brew upgrade tmux
	-brew upgrade fish
	-brew upgrade zsh
	-brew upgrade neovim
	-brew upgrade git
	-brew upgrade tree
	-brew upgrade ack
	-brew upgrade wget
	-brew upgrade trash
	-brew upgrade jq
	-brew upgrade curl-openssl
	curl -L https://get.volta.sh | bash 
	-brew upgrade coreutils
	-brew upgrade watchman
	-brew cleanup
	-mas upgrade
	nvim -c 'PlugUpgrade' -c 'xa'
	nvim -c 'PlugUpdate' -c 'xa'
	nvim -c 'PlugClean' -c 'xa'
