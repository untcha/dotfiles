#!/bin/bash

get_homebrew_git_config_file_path() {

    local path=""

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if path="$(brew --repository 2> /dev/null)/.git/config"; then
        printf "%s" "$path"
        return 0
    else
        printf "Homebrew (get config file path)"
        return 1
    fi

}

main() {
	
	get_homebrew_git_config_file_path
	
}

main