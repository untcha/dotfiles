#!/bin/bash

source ./global_functions.sh;

zshrc_custom=$global_dotfiles_dir/.zshrc;		# custom .zshrc source file
zshrc_destination=$HOME/.zshrc					# destination for the custom .zshrc file

if [ -f $zshrc_destination ]; then
	rm $zshrc_destination;
	cat $zshrc_custom > $zshrc_destination;
else
	cat $zshrc_custom > $zshrc_destination;
fi
