#!/bin/bash

install_casks() {
	# Update brew
	brew update
	
	# tap cask and versions
	brew tap caskroom/cask
	brew tap caskroom/versions
	
	# Clean up
	brew cask cleanup
}