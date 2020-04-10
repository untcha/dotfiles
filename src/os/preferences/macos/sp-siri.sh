#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Preferences - Siri\n\n"

# Set 'Enable Ask Siri' to true (1)
execute "defaults write com.apple.assistant.support 'Assistant Enabled' -int 1" \
	"Set 'Enable Ask Siri' to true (1)"

# Set 'Keyboard Shortcut' to 'Hold Command Space'
execute "defaults write com.apple.Siri HotkeyTag -int 2" \
	"Set 'Keyboard Shortcut' to 'Hold Command Space'"

# Set 'Show Siri in menu bar' to true (1)
execute "defaults write com.apple.Siri StatusMenuVisible -int 1" \
	"Set 'Show Siri in menu bar' to true (1)"