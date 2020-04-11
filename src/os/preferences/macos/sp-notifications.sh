#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Preferences - Notifications\n\n"

# Do Not Disturb settings

# Set 'When the screen is locked' to true (1)
execute "defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui dndEnabledDisplayLock -int 1" \
	"# Set 'When the screen is locked' to true (1)"

# Set 'When display is sleeping' to true (1)
execute "defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui dndEnabledDisplaySleep -int 1" \
	"# Set 'When display is sleeping' to true (1)"

# Set start value for scheduled DND (calc example: 15:00 --> 15 * 60 + 0 = 900; 18:30 --> 18 * 60 + 30 = 1110)
execute "defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui dndStart -int 1380" \
	"Set start value for scheduled DND"

# Set end value for scheduled DND (calc example: 15:00 --> 15 * 60 + 0 = 900; 18:30 --> 18 * 60 + 30 = 1110)
execute "defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui dndEnd -int 480" \
	"Set end value for scheduled DND"

# defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -int 0