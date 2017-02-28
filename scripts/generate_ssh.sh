#!/bin/bash

###############################################################################
# This script generates the ssh config file from the .ssh.config template
###############################################################################

me=$BASH_SOURCE;

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/global_functions.sh";

ssh_config_custom=$global_dotfiles_dir/.ssh.config;		# custom ssh config source file
ssh_config_destination=$HOME/.ssh/config				# destination for the custom ssh config file

# Generate ssh config file from the template .dotfiles/ssh/config
generate_ssh_config() {
	if [ -f $ssh_config_destination ]; then
		rm $ssh_config_destination;
		cat $ssh_config_custom > $ssh_config_destination;
	else
		cat $ssh_config_custom > $ssh_config_destination;
	fi
}
