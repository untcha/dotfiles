#!/bin/bash

install_casks() {
	# tap cask and versions
	brew tap caskroom/cask
	brew tap caskroom/versions
	
	# Clean up
	brew cask cleanup
}