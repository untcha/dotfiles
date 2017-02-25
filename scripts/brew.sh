#!/bin/bash

###############################################################################
# This script installs homebrew and (optional) some brews and casks defined in
# ./brew/brewfile.sh and
# ./brew/caskfile.sh
###############################################################################

EMOJI_OK=$'\xE2\x9C\x85';
EMOJI_NOK=$'\xE2\x9B\x94';
EMOJI_WRENCH=$'\xF0\x9F\x94\xA7';
EMOJI_FIRE=$'\xF0\x9F\x94\xA5';
EMOJI_SHELL=$'\xF0\x9F\x90\x9A';
EMOJI_QUESTION=$'\xE2\x9D\x93';

me=$BASH_SOURCE;

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
