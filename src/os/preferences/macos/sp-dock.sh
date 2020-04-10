#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Preferences - Dock\n\n"

# Set 'Size' to 36
execute "defaults write com.apple.dock tilesize -int 36" \
	"Set 'Size' to 36"

# Set 'Minimise windows into applications icon' to true (1)
execute "defaults write com.apple.dock minimize-to-application -int 1" \
	"Set 'Minimise windows into applications icon' to true (1)"

# Set 'Animate opening applications' to false (0)
execute "defaults write com.apple.dock launchanim -int 0" \
	"Set 'Animate opening applications' to false (0)"

# Set 'Show recent applications in Dock' to false (0)
execute "defaults write com.apple.dock show-recents -int 0" \
	"Set 'Show recent applications in Dock' to false (0)"