#!/bin/bash

###############################################################################
# This script installs homebrew
###############################################################################

me=$BASH_SOURCE;

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

if [[ -e `which brew` ]]; then
	echo "Homebrew is already installed!";
else
	echo "Homebrew is NOT installed!";
	echo "Installing Homebrew...";
	echo "do do do...";
	echo "Homebrew is now installed!";
fi

read -p "Would you like to install brews? [y/n] " -n 1;
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
	echo "Installing brew packages...";
	source ./brewfile.sh
	install_brew_packages;
	echo "All brew packages are now installed";
fi
