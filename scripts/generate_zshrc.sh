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


# Modify .zshrc DEFAULT_USER
#search_string_user="DEFAULT_USER=\"default_user\"";
#replace_string_user="DEFAULT_USER=\"$(whoami)\"";

#sed -i '' 's/'"$search_string_user"'/'"$replace_string_user"'/g' "$zshrc_destination";

# Modify .zshrc installation path
#search_string_path="export ZSH\=\/Users\/default_user\/.oh-my-zsh";
#replace_string_path="export ZSH\=\/Users\/$(whoami)\/.oh-my-zsh";

#sed -i '' 's/'"$search_string_path"'/'"$replace_string_path"'/g' "$zshrc_destination";



search_string="CURRENT_USER";
replace_string="$(whoami)";

sed -i '' 's/'"$search_string"'/'"$replace_string"'/g' "$zshrc_destination";