#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `config_macos.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# System Preferences / General
./sp-general.sh

# System Preferences / Desktop & Screensaver
# TODO: Try to get and set current wallpaper from Dropbox

# System Preferences / Dock
./sp-dock.sh

# System Preferences / Mission Control
./sp-mission-control.sh

# System Preferences / Siri
./sp-siri.sh

# System Preferences / Language & Region
./sp-language-region.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Kill affected applications

print_in_purple "\n   Kill apps and restart the system\n\n"

for app in "Activity Monitor" \
	"cfprefsd" \
	"Dock" \
	"Finder" \
	"NotificationCenter" \
	"SystemUIServer"; do
		
	execute "killall '${app}' &> /dev/null" \
		"killall '${app}'"	
	
done