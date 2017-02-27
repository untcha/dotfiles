#!/bin/bash

me=$BASH_SOURCE;

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/global_functions.sh";

zshrc_custom=$global_dotfiles_dir/.zshrc;		# custom .zshrc source file
zshrc_destination=$HOME/.zshrc					# destination for the custom .zshrc file

# Generate .zshrc file from the template .dotfiles/.zshrc
generate_zshrc() {
	if [ -f $zshrc_destination ]; then
		rm $zshrc_destination;
		cat $zshrc_custom > $zshrc_destination;
	else
		cat $zshrc_custom > $zshrc_destination;
	fi
}

# Replace the 'CURRENT_USER' string in the .zshrc template with the current user $(whoami)
modify_zshrc() {
	search_string="CURRENT_USER";
	replace_string="$(whoami)";

	sed -i '' 's/'"$search_string"'/'"$replace_string"'/g' "$zshrc_destination";
}
