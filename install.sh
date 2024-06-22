 #!/bin/bash
#Variables
#dotfiles_dir = pwd
#
BASEDIR=$(dirname $0)
SCRIPT_DIR=$( cd -- "$( dirname -- '${BASH_SOURCE[0]}' )" &> /dev/null && pwd )
#Delete
#rm -rf ~/.vimrc > /dev/null 2>&1
#Make Symlink
echo "$SCRIPT_DIR"
ln -sf "$SCRIPT_DIR/.vimrc" ~/.vimrc
