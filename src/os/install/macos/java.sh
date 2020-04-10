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

install_sdk() {
	
	declare -r SDK_READABLE_NAME="$1"
	declare -r SDK_NAME="$2"
	declare -r SDK_VERSION="$3"
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	source "$HOME/.sdkman/bin/sdkman-init.sh"
	
	if sdk current $SDK_NAME | grep $SDK_VERSION &> /dev/null; then
		print_success "$SDK_READABLE_NAME $SDK_VERSION"
	else
		execute \
			"sdk install $SDK_NAME $SDK_VERSION" \
			"$SDK_READABLE_NAME $SDK_VERSION"
	fi
	
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	
	print_in_purple "\n   Java\n\n"
	
	install_sdkman
	configure_sdkman
	install_sdk "Java" "java" "14.0.0-open"
	
	
}

main