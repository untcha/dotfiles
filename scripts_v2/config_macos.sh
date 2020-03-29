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
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
    "cfprefsd" \
    "Dock" \
    "Finder" \
    "SystemUIServer"; do
    killall "${app}" &> /dev/null
done
