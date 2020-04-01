#!/bin/bash

declare -r GITHUB_REPOSITORY="untcha/dotfiles"

declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/master/src/os/utils.sh"


# ----------------------------------------------------------------------
# | Helper Functions                                                   |
# ----------------------------------------------------------------------

download() {

    local url="$1"
    local output="$2"

    if command -v "curl" &> /dev/null; then

        curl -LsSo "$output" "$url" &> /dev/null
        #     │││└─ write output to file
        #     ││└─ show error messages
        #     │└─ don't show the progress meter
        #     └─ follow redirects

        return $?

    elif command -v "wget" &> /dev/null; then

        wget -qO "$output" "$url" &> /dev/null
        #     │└─ write output to file
        #     └─ don't show output

        return $?
    fi

    return 1

}

download_utils() {

    local tmpFile=""

    tmpFile="$(mktemp /tmp/dotfiles-tmp)"

    download "$DOTFILES_UTILS_URL" "$tmpFile" \
        && . "$tmpFile" \
        && rm -rf "$tmpFile" \
        && return 0

   return 1

}

# ----------------------------------------------------------------------
# | Main                                                               |
# ----------------------------------------------------------------------

main() {
	echo "DEBUG: setup.sh/main"
	
	# Ensure that the following actions
    # are made relative to this file's path.
	
	cd "$(dirname "${BASH_SOURCE[0]}")" \
		|| exit 1
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	# Load utils
	
	if [ -s "utils.sh" ]; then
		. "utils.sh" || exit 1
	else
		download_utils || exit 1
	fi
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	ask_for_sudo
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - 
	
	# Check if this script was run directly (./<path>/setup.sh),
	# and if not, it most likely means that the dotfiles were not
	# yet set up, and they will need to be downloaded.
	
	printf "%s" "${BASH_SOURCE[0]}" | grep "setup.sh" &> /dev/null \
		|| test
	
	
	
}

main "$@"