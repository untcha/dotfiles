#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

brew_install() {

    declare -r CMD="$4"
    declare -r CMD_ARGUMENTS="$5"
    declare -r FORMULA="$2"
    declare -r FORMULA_READABLE_NAME="$1"
    declare -r TAP_VALUE="$3"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Check if `Homebrew` is installed.

    if ! cmd_exists "brew"; then
        print_error "$FORMULA_READABLE_NAME ('Homebrew' is not installed)"
        return 1
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # If `brew tap` needs to be executed,
    # check if it executed correctly.

    if [ -n "$TAP_VALUE" ]; then
        if ! brew_tap "$TAP_VALUE"; then
            print_error "$FORMULA_READABLE_NAME ('brew tap $TAP_VALUE' failed)"
            return 1
        fi
    fi

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install the specified formula.

    # shellcheck disable=SC2086
    if brew $CMD list "$FORMULA" &> /dev/null; then
        print_success "$FORMULA_READABLE_NAME"
    else
        execute \
            "brew $CMD install $FORMULA $CMD_ARGUMENTS" \
            "$FORMULA_READABLE_NAME"
    fi

}

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

brew_prefix() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if path="$(brew --prefix 2> /dev/null)"; then
        printf "%s" "$path"
        return 0
    else
        print_error "Homebrew (get prefix)"
        return 1
    fi

}

brew_tap() {
	brew tap "$1" &> /dev/null
}

brew_tap_only() {
	
	execute \
		"brew tap '$1'" \
		"tap '$1'"
	
}

brew_update() {
	
	execute \
		"brew update" \
		"Homebrew (update)"
	
}

brew_upgrade() {
	
	execute \
		"brew upgrade" \
		"Homebrew (upgrade)"
	
}