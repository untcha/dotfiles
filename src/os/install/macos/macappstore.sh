#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
		&& . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

function_mas_install () {
	
	declare -r APP_NAME="$1"
	declare -r PRODUCT_ID="$2"
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	# Check if `mas-cli` is installed.
	
	if ! cmd_exists "mas"; then
		print_error "$APP_NAME ('mas-cli' is not installed)"
		return 1
	fi
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	if mas list | grep $PRODUCT_ID &> /dev/null; then
		print_success "$APP_NAME"
	else
		execute \
			"mas install $PRODUCT_ID" \
			"$APP_NAME"
	fi
	
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	
	print_in_purple "\n   macOS App Store\n\n"
	
	function_mas_install "Affinity Designer" "824171161"
	function_mas_install "Affinity Photo" "824183456"
	function_mas_install "Amphetamine" "937984704"
	function_mas_install "Fantastical" "975937182"
	function_mas_install "Magnet" "441258766"
	function_mas_install "PDF Expert" "1055273043"
	function_mas_install "Reeder" "1449412482"
	function_mas_install "Spark" "1176895641"
	function_mas_install "Textastic" "572491815"
	function_mas_install "Todoist" "585829637"
	function_mas_install "WhatsApp" "1147396723"
	
	#TODO: Choose between Home and Work
	#Word: 462054704
	#Powerpoint: 462062816
	#Excel: 462058435
	#Outlook: 985367838
	#OneDrive: 823766827
	#OneNote: 784801555
	#https://github.com/mas-cli/mas/issues/220
	
}

main