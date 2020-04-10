#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Preferences - General\n\n"

execute "defaults write NSGlobalDomain AppleInterfaceStyle -string 'Dark'" \
	"Set 'Appearance' to dark"