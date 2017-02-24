#!/bin/bash

install_brews() {
	# Update brew
	brew update
	
	# Install Formulae
	brew install fping
	brew install git
	brew install mas
	brew install mplayer
	brew install node
	brew install prettyping
	brew install python3
	brew install speedtest_cli
	brew install tree
	brew install tvnamer
	
	# Clean up
	brew cleanup
}