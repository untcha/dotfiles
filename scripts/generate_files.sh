#!/bin/bash

me=$BASH_SOURCE;

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/global_functions.sh";

read -p "Would you like to generate the ssh config file? [y/n]" -n 1;
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
	echo "[$me]"$EMOJI_WRENCH ": Generating ssh-config...";
	source ./generate_ssh-config.sh
	generate_ssh_config;
fi

read -p "Would you like to generate .zshrc file? [y/n]" -n 1;
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
	echo "[$me]"$EMOJI_WRENCH ": Generating .zshrc...";
	source ./generate_zshrc.sh
	generate_zshrc;
	echo "[$me]"$EMOJI_WRENCH ": Modifying .zshrc...";
	modify_zshrc;
fi
