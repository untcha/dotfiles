#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Misc settings - Menu bar / Clock / Timezone\n\n"

# Show menu bar icons
execute "defaults write com.apple.systemuiserver 'NSStatusItem Visible com.apple.menuextra.airplay' -int 1 && \
		 defaults write com.apple.systemuiserver 'NSStatusItem Visible com.apple.menuextra.airport' -int 1 && \
		 defaults write com.apple.systemuiserver 'NSStatusItem Visible com.apple.menuextra.battery' -int 1 && \
		 defaults write com.apple.systemuiserver 'NSStatusItem Visible com.apple.menuextra.bluetooth' -int 1 && \
		 defaults write com.apple.systemuiserver 'NSStatusItem Visible com.apple.menuextra.clock' -int 1 && \
		 defaults write com.apple.systemuiserver 'NSStatusItem Visible com.apple.menuextra.volume' -int 1 && \
		 defaults write com.apple.systemuiserver menuExtras ' \
		 ( \
			'/System/Library/CoreServices/Menu Extras/Clock.menu', \
			'/System/Library/CoreServices/Menu Extras/Battery.menu', \
			'/System/Library/CoreServices/Menu Extras/AirPort.menu', \
			'/System/Library/CoreServices/Menu Extras/Bluetooth.menu', \
			'/System/Library/CoreServices/Menu Extras/Volume.menu', \
			'/System/Library/CoreServices/Menu Extras/Displays.menu' \
		 )'" \
	"Show menu bar icons"

# Show Battery percentage
execute "defaults write com.apple.menuextra.battery ShowPercent -string 'YES'" \
	"Show Battery percentage"

# Configure Clock settings
execute "defaults write com.apple.menuextra.clock DateFormat -string 'HH:mm:ss'" \
	"Configure Clock settings"

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
execute "sudo systemsetup -settimezone 'Europe/Berlin' > /dev/null" \
	"Set the timezone to 'Europe/Berlin'"