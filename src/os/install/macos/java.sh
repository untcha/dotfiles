#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
		&& . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_sdkman() {
	if ! cmd_exists "sdk"; then
		curl -s "https://get.sdkman.io" | bash &> /dev/null
	fi
	
	print_result $? "SDKMAN!"
	
}

configure_sdkman() {
	
	if cmd_exists "sdk"; then
		source "$HOME/.sdkman/bin/sdkman-init.sh"
	fi
	
	print_result $? "SDKMAN! (Config)"
	
}

install_java_sdk() {
	
	print_result $? "Java"
	
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	
	print_in_purple "\n   Java\n\n"
	
	install_sdkman
	configure_sdkman
	install_java_sdk
	
	
}

main