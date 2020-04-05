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

customize_zshrc() {
	
	declare -r ZSHRC_PATH="$HOME/.zshrc"
	
	local zshAutosuggestionsPath="/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
	local zshSyntaxHighlightingPath="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	
	
	execute \
		"printf '%s\n' 'source $zshAutosuggestionsPath' | sudo tee -a '$ZSHRC_PATH'" \
		"Oh My Zsh (add zsh-autosuggestions.zsh in '$ZSHRC_PATH')" \
	
	execute \
		"printf '%s\n' 'source $zshSyntaxHighlightingPath' | sudo tee -a '$ZSHRC_PATH'" \
		"Oh My Zsh (add zsh-syntax-highlighting.zsh in '$ZSHRC_PATH')" \
	
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	
	print_in_purple "\n   Oh My Zsh\n\n"
	
	install_oh-my-zsh
	
	brew_install "zsh-autosuggestions" "zsh-autosuggestions"
	brew_install "zsh-syntax-highlighting" "zsh-syntax-highlighting"
	
	customize_zshrc
	
}

main