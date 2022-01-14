#!/bin/bash

## Download with package manager
os_name=$(uname)
if [[ $os_name == "Linux" ]]
then
	issue=($(cat /etc/issue))
	disv=$issue
elif [[ $os_name == "Darwin" ]]
then
	disv="macOS"
fi
if [[ $disv == "Arch" ]]
then
	yay -Syyu --noconfirm enca bat tmux moreutils
	wget https://github.com/chenjiandongx/pls/releases/download/v0.1.4/pls_linux_amd64 -O $HOME/.bin/pls
elif [[ $disv == "Ubuntu" ]]
then
	sudo apt update
	sudo apt upgrade -y
	sudo apt install -y enca bat tmux moreutils
	wget https://github.com/chenjiandongx/pls/releases/download/v0.1.4/pls_linux_amd64 -O $HOME/.bin/pls
elif [[ $disv == "macOS" ]]

then
	brew update
	brew upgrade
	brew install enca bat tmux moreutils
	wget https://github.com/chenjiandongx/pls/releases/download/v0.1.4/pls_darwin_amd64 -O $HOME/.bin/pls
fi
chmod +x $HOME/.bin/pls
$HOME/.bin/pls upgrade

## Download with pip
pip install html2text --user