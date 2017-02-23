#!/bin/bash

if [[ -e `which brew` ]]; then
	echo "Hombrew is already installed."
else
	echo "Installing Hombrew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo "Done..."
fi

echo "Updating Homebrew..."
brew update

read -p "Would you like to install brews? [y/n]" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo -n "Installing..."
	source ../brew/brewfile.sh
	install_brews
fi
