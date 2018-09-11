#!/bin/bash
#Variables
#dotfiles_dir = pwd

#Delete
rm -rf ~/.vimrc > /dev/null 2>&1

#Make Symlink
ln -sf pwd/.vimrc   ~/.vimrc
