#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

change_default_shell() {
	
	local brewPrefix=""
	local newShellPath=""
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	# Try to get the path of the `Zsh`
	# version installed through `Homebrew`.
	
	brewPrefix="$(brew_prefix)" \
        || return 1
	
	newShellPath="$brewPrefix/bin/zsh"
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	# Add the path of the `Bash` version installed through `Homebrew`
	# to the list of login shells from the `/etc/shells` file.
	#
	# This needs to be done because applications use this file to
	# determine whether a shell is valid (e.g.: `chsh` consults the
	# `/etc/shells` to determine whether an unprivileged user may
	# change the login shell for her own account).
	#
	# http://www.linuxfromscratch.org/blfs/view/7.4/postlfs/etcshells.html
	
	if ! grep "$newShellPath" < /etc/shells &> /dev/null; then
		execute \
			"printf '%s\n' '$newShellPath' | sudo tee -a /etc/shells" \
			"Zsh (add '$newShellPath' in '/etc/shells')" \
		|| return 1
	fi
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	# Set latest version of `Zsh` as the default
	# (macOS uses by default an older version of `Zsh`).
	
	chsh -s "$newShellPath" &> /dev/null
	print_result $? "Zsh (use latest version)"
	
}

create_zshrc() {
	
	declare -r FILE_PATH="$HOME/.zshrc"
	
	local zshVersion=$(zsh --version | awk '{print $2}')
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then
		printf "%s\n" "# Created by newuser for $zshVersion" >> "$FILE_PATH"
	fi
	
	print_result $? "$FILE_PATH"
	
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	
	print_in_purple "\n   Shell\n\n"
	
	brew_install "Zsh Test" "zsh" \
		&& change_default_shell
	
	create_zshrc
	
	#brew_install "Bash Completion 2" "bash-completion@2"

}

main