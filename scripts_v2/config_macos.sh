#!/bin/bash

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `config_macos.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

###############################################################################
# General                                                                     #
###############################################################################
# open -a TextEdit filename

# Set "Appearance" to dark
defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# TODO: Set default web browser
# TODO: cask and install Google Chrome

# Set "Ask to keep changes when closing documents" to true
defaults write NSGlobalDomain NSCloseAlwaysConfirmsChanges -int 1


###############################################################################
# Screen                                                                      #
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
