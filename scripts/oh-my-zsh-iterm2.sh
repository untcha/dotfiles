#!/bin/bash

###############################################################################
# Install zsh via homebrew and set as default shell                           #
###############################################################################

# Check if zsh is installed via homebrew; install if not
if [[ -e "/usr/local/bin/zsh" ]];
then
	echo "zsh is already installed via homebrew!";
else
	echo "zsh is NOT installed! Installing zsh via homebrew...";
	brew install zsh;
	brew install zsh-syntax-highlighting;
	echo "zsh is now installed!";
fi

# Check if zsh is default shell; make default shell if not
if [[ $SHELL = "/usr/local/bin/zsh" ]];
then
	echo "zsh is already set as default shell!";
else
	echo "zsh is NOT set as default shell! Setting zsh as default shell...";
	echo "...";
	sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells" && chsh -s /usr/local/bin/zsh;
	echo "zsh is now set as default shell!";
	echo " ";
	echo "Make sure to exit your current Terminal session and open Terminal again. Select 0 if asked by zsh! Run this script again!"
fi

###############################################################################
# Install Oh-My-Zsh and iTerm2                                                #
###############################################################################

# Check if Oh-My-Zsh is installed; install if not
if [[ -d "/Users/$(whoami)/.oh-my-zsh" ]];
then
	echo "Oh-My-Zsh is already installed!";
else
	echo "Oh-My-Zsh is NOT installed! Installing Oh-My-Zsh...";
	echo "...";
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
	echo "Oh-My-Zsh is now installed!";
fi

# Check if iTerm2 is installed; install via homebrew cask if not
if [[ -e "/Applications/iTerm.app" ]];
then
	echo "iTerm2 is already installed!";
else
	echo "iTerm2 is NOT installed! Installing iTerm2...";
	echo "...";
	brew cask install iterm2;
	echo "iTerm2 is now installed!"
fi