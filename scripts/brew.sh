#!/bin/bash

if [[ -e `which brew` ]]; then
	echo "Hombrew is already installed."
else
	echo "Installing hombrew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	echo "Done..."
fi

echo "Updating homebrew..."
brew update
