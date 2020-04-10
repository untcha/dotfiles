#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Preferences - Language & Region\n\n"

# Set 'Preferred languages' to 'en-US' (primary) and 'de-DE'
execute "defaults write NSGlobalDomain AppleLanguages -array 'en-US' 'de-DE'" \
	"Set 'Preferred languages' to 'en-US' (primary) and 'de-DE'"

# Set 'Region' to 'Germany' (@currency=EUR)
execute "defaults write NSGlobalDomain AppleLocale -string 'en_DE'" \
	"Set 'Region' to 'Germany' (@currency=EUR)"

# Locale for zsh will be set in .zshrc

# Set 'Measurement units' to 'Centimeters' (Metric)
execute "defaults write NSGlobalDomain AppleMeasurementUnits -string 'Centimeters'" \
	"Set 'Measurement units' to 'Centimeters' (Metric)"
execute "defaults write NSGlobalDomain AppleMetricUnits -int 1" \
	"Set 'Measurement units' to 'Centimeters' (Metric)"