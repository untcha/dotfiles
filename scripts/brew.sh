#!/bin/bash

DOTFILE_STRING="[.dotfiles/scripts/brew.sh] ";
WRENCH_EMOJI=$'\xF0\x9F\x94\xA7';
SHELL_EMOJI=$'\xF0\x9F\x90\x9A';
FIRE_EMOJI=$'\xF0\x9F\x94\xA5';
OK_EMOJI=$'\xE2\x9C\x85';
NOK_EMOJI=$'\xE2\x9B\x94';

if [[ -e `which brew` ]];
then
	echo $DOTFILE_STRING $OK_EMOJI ": Hombrew is already installed.";
else
	echo $DOTFILE_STRING $WRENCH_EMOJI ": Installing Hombrew...";
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)";
	echo $DOTFILE_STRING $OK_EMOJI ": Homebrew is now installed!";
fi

echo $DOTFILE_STRING $WRENCH_EMOJI ": Updating Homebrew...";
brew update;

read -p "Would you like to install brews? [y/n]" -n 1;
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
	echo $DOTFILE_STRING $WRENCH_EMOJI ": Installing brews...";
	source ../brew/brewfile.sh;
	install_brews;
	echo $DOTFILE_STRING $OK_EMOJI ": All brews are now installed!";
fi

read -p "Would you like to install casks? [y/n]" -n 1;
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
	echo $DOTFILE_STRING $WRENCH_EMOJI ": Installing casks...";
	source ../brew/caskfile.sh;
	install_casks;
	echo $DOTFILE_STRING $OK_EMOJI ": All casks now installed!";
fi
