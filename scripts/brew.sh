#!/bin/bash

###############################################################################
# This script installs homebrew and (optional) some brews and casks defined in
# ./brew/brewfile.sh and
# ./brew/caskfile.sh
###############################################################################

me=$BASH_SOURCE;
source ./global_functions.sh

if [[ -e `which brew` ]]; then
	echo "[$me]"$EMOJI_OK ": Homebrew is already installed.";
else
	echo "[$me]"$EMOJI_WRENCH ": Installing Hombrew...";
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
	echo "[$me]"$EMOJI_OK ": Homebrew is now installed!";
fi

# removed because brewfile.sh and caskfile.sh run brew update
# echo "[$me]"$EMOJI_WRENCH ": Updating Homebrew...";
# brew update;

read -p "Would you like to install brews? [y/n]" -n 1;
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
	echo "[$me]"$EMOJI_WRENCH ": Installing brews...";
	source ../brew/brewfile.sh;
	install_brews;
	echo "[$me]"$EMOJI_OK ": All brews are now installed!";
fi

read -p "Would you like to install casks? [y/n]" -n 1;
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
	echo "[$me]"$EMOJI_WRENCH ": Installing casks...";
	source ../brew/caskfile.sh;
	install_casks;
	echo "[$me]"$EMOJI_OK ": All casks now installed!";
fi
