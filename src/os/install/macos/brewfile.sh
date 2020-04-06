#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
		&& . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

taps() {
	
	brew_tap_only "homebrew/cask-versions"
	brew_tap_only "homebrew/bundle"
	brew_tap_only "buo/cask-upgrade"
	brew_tap_only "jakehilborn/jakehilborn"		# Required for displayplacer
	
}

brews() {
	
	# Cask dependencies
	brew_install "mas" "mas"
	
	# CLI utilities
	brew_install "curl" "curl"
	brew_install "git" "git"
	brew_install "grep" "grep"
	brew_install "mpssh" "mpssh"
	brew_install "pv" "pv"
	brew_install "pwgen" "pwgen"
	brew_install "ripgrep" "ripgrep"
	brew_install "ssh-copy-id" "ssh-copy-id"
	brew_install "tree" "tree"
	brew_install "wget" "wget"
	
	# Shell (tools)
	brew_install "antigen" "antigen"
	
	# macOS tools
	brew_install "clamav" "clamav"
	brew_install "displayplacer" "displayplacer"
	brew_install "duti" "duti"
	brew_install "mackup" "mackup"
	brew_install "topgrade" "topgrade"

	# Other useful tools
	brew_install "highlight" "highlight"
	brew_install "jenv" "jenv"
	brew_install "pandoc" "pandoc"
	#brew_install "xdotool" "xdotool"

	# Network tools
	brew_install "fping" "fping"
	brew_install "prettyping" "prettyping"
	brew_install "speedtest_cli" "speedtest_cli"
	
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	
	print_in_purple "\n   Taps, Brews and Casks\n\n"
	
	taps
	brews
	
}

main