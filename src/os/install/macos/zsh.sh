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
			"printf '%s\n' '$newShellPath' | tee -a /etc/shells" \
			"Zsh (add '$newShellPath' in '/etc/shells')" \
		|| return 1
	fi
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	# Set latest version of `Bash` as the default
	# (macOS uses by default an older version of `Bash`).
	
	chsh -s "$newShellPath" &> /dev/null
	print_result $? "Zsh (use latest version)"
	
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	
	print_in_purple "\n   Shell\n\n"
	
	brew_install "Zsh" "zsh" \
		&& change_default_shell
	
	#brew_install "Bash Completion 2" "bash-completion@2"

}

main