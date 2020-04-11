#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Preferences - Keyboard\n\n"

# Set Input Source ID to 'German'
execute "defaults write com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID -string 'com.apple.keylayout.German'" \
	"Set Input Source ID to 'German'"

# Set 'Enabled Input Sources'
execute "defaults write com.apple.HIToolbox AppleEnabledInputSources -array '
<dict>
<key>InputSourceKind</key>
<string>Keyboard Layout</string>
<key>KeyboardLayout ID</key>
<integer>3</integer>
<key>KeyboardLayout Name</key>
<string>German</string>
</dict>'" \
	"Set 'Enabled Input Sources'"

# Set 'Input Source History'
execute "defaults write com.apple.HIToolbox AppleInputSourceHistory -array '
<dict>
<key>InputSourceKind</key>
<string>Keyboard Layout</string>
<key>KeyboardLayout ID</key>
<integer>3</integer>
<key>KeyboardLayout Name</key>
<string>German</string>
</dict>'" \
	"Set 'Input Source History'"

# Set 'Selected Input Sources'
execute "defaults write com.apple.HIToolbox AppleSelectedInputSources -array '
<dict>
<key>InputSourceKind</key>
<string>Keyboard Layout</string>
<key>KeyboardLayout ID</key>
<integer>3</integer>
<key>KeyboardLayout Name</key>
<string>German</string>
</dict>'" \
	"Set 'Selected Input Sources'"