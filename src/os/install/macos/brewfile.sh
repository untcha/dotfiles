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
	brew_install "brew mas" "mas"
	
	# CLI utilities
	brew_install "brew curl" "curl"
	brew_install "brew git" "git"
	brew_install "brew grep" "grep"
	brew_install "brew mpssh" "mpssh"
	brew_install "brew pv" "pv"
	brew_install "brew pwgen" "pwgen"
	brew_install "brew ripgrep" "ripgrep"
	brew_install "brew ssh-copy-id" "ssh-copy-id"
	brew_install "brew tree" "tree"
	brew_install "brew wget" "wget"
	
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

casks() {
	
	brew_install "1Password" "1password" "homebrew/cask" "cask"
	brew_install "Google Chrome" "google-chrome" "homebrew/cask" "cask"
	
	
	#brew_install "" "" "" ""
	
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	
	print_in_purple "\n   Taps, Brews and Casks\n\n"
	
	taps
	brews
	casks
	
}

main