#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Preferences - General\n\n"

# Set 'Appearance' to dark
execute "defaults write NSGlobalDomain AppleInterfaceStyle -string 'Dark'" \
	"Set 'Appearance' to dark"

# TODO: Set default web browser

# Set 'Ask to keep changes when closing documents' to true (1)
execute "defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -int 1" \
	"Set 'Ask to keep changes when closing documents' to true (1)"