#!/bin/bash

if [[ -e `which brew` ]]; then
	echo "Hombrew is already installed.";
else
	echo "Installing Hombrew...";
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
	echo "Done...";
fi;

echo "Updating Homebrew...";
brew update;

read -p "Would you like to install brews? [y/n]" -n 1;
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo " ";
	echo "Installing brews...";
	source ../brew/brewfile.sh;
	install_brews;
fi;

read -p "Would you like to install casks? [y/n]" -n 1;
if [[ $REPLY =~ ^[Yy]$ ]]; then
	echo " ";
	echo "Installing casks...";
	source ../brew/caskfile.sh;
	install_casks;
fi;
