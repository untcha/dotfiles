#!/bin/bash

# ==============================================================
# This script is based on Mathias Bynens bootstrap.sh script
#
# The original script can be found at:
# Mathias Bynens, https://github.com/mathiasbynens/dotfiles
# ==============================================================

# Make the script executable: $ chmod a+x bootstrap.sh

cd "$(dirname "${BASH_SOURCE}")";

# git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".gitignore" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE.txt" \
		-avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;
