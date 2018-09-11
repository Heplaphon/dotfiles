#!/bin/bash
#Variables
#dotfiles_dir = ~/.dotfiles

#Delete
rm -rf ~/.vimrc > /dev/null 2>&1

#Make Symlink
ln -sf ~/.dotfiles/.vimrc   ~/.vimrc
