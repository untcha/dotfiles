#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

set_resolution() {
	
	declare -r RESOLUTION=$1
	
	declare -r PERSISTENT_SCREEN_ID=$(displayplacer list | grep 'Persistent screen id:' | awk '{print $4}')
	declare -r COLOR_DEPTH=$(displayplacer list | grep 'Color Depth:' | awk '{print $3}')
	
	execute "displayplacer 'id:$PERSISTENT_SCREEN_ID res:$RESOLUTION color_depth:$COLOR_DEPTH scaling:on origin:(0,0) degree:0'" \
		"Set resolution to '$RESOLUTION'"
	
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	
	# TODO: set resolution depending on MacBook 'scutil --get LocalHostName'
	set_resolution "1680x1050"
	
}

main