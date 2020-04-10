#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Preferences - Mission Control\n\n"

# Set 'Displays have separate Spaces' to true (1)
execute "defaults write com.apple.spaces spans-displays -int 1" \
	"Set 'Displays have separate Spaces' to true (1)"