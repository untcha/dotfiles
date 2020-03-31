#!/bin/bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `config_macos.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# System Preferences/General                                                  #
###############################################################################
# open -a TextEdit filename

# Set "Appearance" to dark
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# TODO: Set default web browser
# TODO: cask and install Google Chrome

# Set "Ask to keep changes when closing documents" to true (1)
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -int 1

###############################################################################
# System Preferences/Desktop & Screensaver                                    #
###############################################################################

# TODO: try to get and set current wallpaper from dropbox

###############################################################################
# System Preferences/Dock                                                     #
###############################################################################

# Set "Size" to 36
defaults write com.apple.dock tilesize -int 36

# Set "Minimise windows into applications icon" to true (1)
defaults write com.apple.dock minimize-to-application -int 1

# Set "Animate opening applications" to false (0)
defaults write com.apple.dock launchanim -int 0

# Set "Show recent applications in Dock" to false (0)
defaults write com.apple.dock show-recents -int 0

###############################################################################
# System Preferences/Mission Control                                          #
###############################################################################

# Set "Displays have separate Spaces" to true (1)
defaults write com.apple.spaces spans-displays -int 1

###############################################################################
# System Preferences/Siri                                                     #
###############################################################################

# Set "Enable Ask Siri" to true (1)
defaults write com.apple.assistant.support "Assistant Enabled" -int 1

# Set "Keyboard Shortcut" to "Hold Command Space"
defaults write com.apple.Siri HotkeyTag -int 2

# Set "Show Siri in menu bar" to true (1)
defaults write com.apple.Siri StatusMenuVisible -int 1

###############################################################################
# System Preferences/Language & Region                                        #
###############################################################################

# Set "Preferred languages" to "en-US" (primary) and "de-DE"
defaults write NSGlobalDomain AppleLanguages -array "en-US" "de-DE"

# Set "Region" to "Germany" (@currency=EUR)
defaults write NSGlobalDomain AppleLocale -string "en_DE"

# Locale for zsh will be set in .zshrc

# Set "Measurement units" to "Centimeters" (Metric)
defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
defaults write NSGlobalDomain AppleMetricUnits -int 1

###############################################################################
# System Preferences/Notifications                                            #
###############################################################################

# Do Not Disturb settings
# Set "When the screen is locked" to true (1)
defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui dndEnabledDisplayLock -int 1

# Set "When display is sleeping" to true (1)
defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui dndEnabledDisplaySleep -int 1

# Set start value for scheduled DND (calc example: 15:00 --> 15 * 60 + 0 = 900; 18:30 --> 18 * 60 + 30 = 1110) 
defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui dndStart -int 1380

# Set end value for scheduled DND (calc example: 15:00 --> 15 * 60 + 0 = 900; 18:30 --> 18 * 60 + 30 = 1110)
defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui dndEnd -int 480

# defaults -currentHost write ~/Library/Preferences/ByHost/com.apple.notificationcenterui doNotDisturb -int 0

###############################################################################
# System Preferences/Security & Privacy                                       #
###############################################################################

#defaults write com.apple.screensaver askForPassword -int 1
#defaults write com.apple.screensaver askForPasswordDelay -int 0
#profiles -I -F ./askforpassworddelay.mobileconfig
# --> Set manually! TODO Documentation!

###############################################################################
# System Preferences/Keyboard                                                 #
###############################################################################

defaults write com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID -string "com.apple.keylayout.German"

defaults write com.apple.HIToolbox AppleEnabledInputSources -array '
<dict>
<key>InputSourceKind</key>
<string>Keyboard Layout</string>
<key>KeyboardLayout ID</key>
<integer>3</integer>
<key>KeyboardLayout Name</key>
<string>German</string>
</dict>'

defaults write com.apple.HIToolbox AppleInputSourceHistory -array '
<dict>
<key>InputSourceKind</key>
<string>Keyboard Layout</string>
<key>KeyboardLayout ID</key>
<integer>3</integer>
<key>KeyboardLayout Name</key>
<string>German</string>
</dict>'

defaults write com.apple.HIToolbox AppleSelectedInputSources -array '
<dict>
<key>InputSourceKind</key>
<string>Keyboard Layout</string>
<key>KeyboardLayout ID</key>
<integer>3</integer>
<key>KeyboardLayout Name</key>
<string>German</string>
</dict>'

###############################################################################
# System Preferences/Trackpad                                                 #
###############################################################################

# Set "Tap to click" to true (1)
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

#defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true
#defaults -currentHost write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -int 1
#defaults -currentHost write com.apple.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -int 1

#defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
#defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true

###############################################################################
# System Preferences/Displays                                                 #
###############################################################################

#scutil --get LocalHostName
resolution="1680x1050"

# Get the persistent screen id
persistent_screen_id=$(displayplacer list | grep 'Persistent screen id:' | awk '{print $4}')

# Get color depth value
color_depth=$(displayplacer list | grep 'Color Depth:' | awk '{print $3}')

# Set screen resolution with displayplacer
displayplacer "id:$persistent_screen_id res:$resolution color_depth:$color_depth scaling:on origin:(0,0) degree:0"

###############################################################################
# Menu bar / Clock / Timezone                                                 #
###############################################################################

# Show menu bar icons
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.airplay" -int 1
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.airport" -int 1
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.battery" -int 1
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.bluetooth" -int 1
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.clock" -int 1
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -int 1

defaults write com.apple.systemuiserver menuExtras '
(
    "/System/Library/CoreServices/Menu Extras/Clock.menu",
    "/System/Library/CoreServices/Menu Extras/Battery.menu",
    "/System/Library/CoreServices/Menu Extras/AirPort.menu",
    "/System/Library/CoreServices/Menu Extras/Bluetooth.menu",
    "/System/Library/CoreServices/Menu Extras/Volume.menu",
    "/System/Library/CoreServices/Menu Extras/Displays.menu"
)'

# Show Battery percentage
defaults write com.apple.menuextra.battery ShowPercent -string "YES"

# Configure Clock settings
defaults write com.apple.menuextra.clock DateFormat -string "HH:mm:ss"

# Set the timezone; see `sudo systemsetup -listtimezones` for other values
sudo systemsetup -settimezone "Europe/Berlin" > /dev/null

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
    "cfprefsd" \
    "Dock" \
    "Finder" \
    "NotificationCenter" \
    "SystemUIServer"; do
    killall "${app}" &> /dev/null
done
