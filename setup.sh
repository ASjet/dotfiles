#!/bin/bash

# Define make link function
function mklnk(){
	if [[ -e $HOME/.$1 ]]; then
		mv $HOME/.$1 $HOME/.$1.bak
	fi
	ln -s $HOME/dotfiles/$1 $HOME/.$1
}

mklnk gitconfig
mklnk npmrc
mklnk pip
mklnk vim
mklnk vimrc
mklnk zshrc
mklnk gdbinit

# User profile
touch $HOME/.profile

# User binary
if [[ ! -e $HOME/.bin ]]; then
	mkdir -p -v $HOME/.bin
fi

# User script
if [[ ! -e $HOME/.script ]]; then
	mkdir -p -v $HOME/.script
fi

# User library
if [[ ! -e $HOME/.lib ]]; then
	mkdir -p -v $HOME/.lib
fi

# vimdir
if [[ ! -e $HOME/.vimdir ]]; then
	mkdir -p -v $HOME/.vimdir
	mkdir -p -v $HOME/.vimdir/swp
	mkdir -p -v $HOME/.vimdir/bak
	mkdir -p -v $HOME/.vimdir/undo
fi

## install necessary tools
source install.sh

# Install powerlevel10k
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
git clone --depth=1 git://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

chsh -s /bin/zsh

# Load zshrc
zsh $HOME/.zshrc

# Configure powerlevel10k
p10k configure
