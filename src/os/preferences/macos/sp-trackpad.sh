#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Preferences - Trackpad\n\n"

# Set 'Tap to click' to true (1)
execute "defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true \
		 defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true \
		 defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1" \
	"Set 'Tap to click' to true (1)"

# Enable 'Three Finger Drag'
execute "defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true \
		 defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
		 defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -int 1" \
	"Enable 'Three Finger Drag'"