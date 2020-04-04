#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
		&& . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_oh-my-zsh() {
	
	if [ ! -e "$ZSH" ] || [ -z "$ZSH" ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &> /dev/null
	fi
	
	print_result $? "Oh My Zsh"
	
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	
	print_in_purple "\n   Oh My Zsh\n\n"
	
	install_oh-my-zsh
	
	brew_install "zsh-autosuggestions"
	brew_install "zsh-syntax-highlighting"
	
}

main