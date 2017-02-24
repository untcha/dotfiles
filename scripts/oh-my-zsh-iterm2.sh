#!/bin/bash

###############################################################################
# Install zsh via homebrew and set as default shell                           #
###############################################################################

# Check if zsh is installed via homebrew; install if not
if [[ -e "/usr/local/bin/zsh" ]];
then
	echo "zsh is already installed via homebrew!";
else
	echo "zsh is NOT installed! Installing via homebrew...";
	brew install zsh;
	echo "zsh is now installed!";
fi

# Check if zsh is default shell; make default shell if not
if [[ $SHELL = "/usr/local/bin/zsh" ]];
then
	echo "zsh is already set as default shell!";
else
	echo "zsh is NOT set as default shell! Setting zsh as default shell...";
	echo "...";
	#sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells" && chsh -s /usr/local/bin/zsh;
	echo "zsh is now set as default shell!";
fi
