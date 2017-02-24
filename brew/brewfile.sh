#!/bin/bash

install_brews() {
	# Update brew
	brew update
	
	# Install Formulae
	brew install fping
	brew install git
	brew install mas
	brew install prettyping
	brew install tree
	brew install tvnamer
	
	# Clean up
	brew cleanup
}