#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_tap() {
	brew tap "$1" &> /dev/null
}

brew_update() {
	
	execute \
		"brew update" \
		"Homebrew (update)"
	
}

brew_upgrade() {
	
	execute \
		"brew upgrade" \
		"Homebrew (upgrade)"
	
}