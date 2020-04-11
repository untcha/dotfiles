#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   System Preferences - Sharing\n\n"

# Set the primary hostname of your mac. Fully qualified hostname, e.g. for mymac.domain.com
execute "sudo scutil --set ComputerName 'rMBP13-2015'" \
	"Set the primary hostname of your mac"

# Set the Bonjour hostname of your mac. The name usable on the network, e.g. for mymac.local
execute "sudo scutil --set HostName 'rMBP13-2015'" \
	"Set the Bonjour hostname of your mac"

# Set the computer name. The user-friendly computer name you see in Finder, e.g. myMac
execute "sudo scutil --set LocalHostName 'rMBP13-2015'" \
	"Set the computer name"