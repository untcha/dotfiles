#!/bin/bash

DOTFILE_STRING="[dotfile] ";
WRENCH_EMOJI=$'\xF0\x9F\x94\xA7';
OK_EMOJI=$'\xE2\x9C\x85';
NOK_EMOJI=$'\xE2\x9B\x94';

###############################################################################
# Install zsh via homebrew and set as default shell                           #
###############################################################################

# Check if zsh is installed via homebrew; install if not
if [[ -e "/usr/local/bin/zsh" ]];
then
	echo $DOTFILE_STRING $OK_EMOJI ": zsh is already installed via homebrew!";
else
	echo "zsh is NOT installed! Installing zsh via homebrew...";
	brew install zsh;
	brew install zsh-syntax-highlighting;
	echo "zsh is now installed!";
fi

# Check if zsh is default shell; make default shell if not
if [[ $SHELL = "/usr/local/bin/zsh" ]];
then
	echo $DOTFILE_STRING $OK_EMOJI ": zsh is already the default shell!";
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
	echo $DOTFILE_STRING $OK_EMOJI ": Oh-My-Zsh is already installed!";
else
	echo "Oh-My-Zsh is NOT installed! Installing Oh-My-Zsh...";
	echo "...";
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
	echo "Oh-My-Zsh is now installed!";
fi

# Check if iTerm2 is installed; install via homebrew cask if not
if [[ -e "/Applications/iTerm.app" ]];
then
	echo $DOTFILE_STRING $OK_EMOJI ": iTerm2 is already installed!";
else
	echo "iTerm2 is NOT installed! Installing iTerm2...";
	echo "...";
	brew cask install iterm2;
	echo "iTerm2 is now installed!"
fi

# Check if font "Meslo" is installed; install (copy from iTerm2) if not
if [[ -e "/Users/$(whoami)/Library/Fonts/Meslo LG M DZ Regular for Powerline.otf" ]];
then
	echo $DOTFILE_STRING $OK_EMOJI ": Font Meslo LG M DZ Regular for Powerline is already installed!";
else
	echo "Font Meslo LG M DZ Regular for Powerline is NOT installed! Installing Meslo...";
	echo "...";
	cp ../iTerm2/Meslo\ LG\ M\ DZ\ Regular\ for\ Powerline.otf /Users/$(whoami)/Library/Fonts;
	echo "Font Meslo LG M DZ Regular for Powerline is now installed!";
fi

###############################################################################
# Further tweaking                                                            #
###############################################################################

# Auto suggestions (for Oh My Zsh)
# Check if zsh-autosuggestions is installed; install if not
if [[ -d "/Users/$(whoami)/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]];
then
	echo $DOTFILE_STRING $OK_EMOJI ": zsh-autosuggestions is already installed!";
else
	echo "zsh-autosuggestions is NOT installed! Installing zsh-autosuggestions...";
	echo "...";
	git clone git://github.com/zsh-users/zsh-autosuggestions /Users/$(whoami)/.oh-my-zsh/custom/plugins/zsh-autosuggestions;
	echo "zsh-autosuggestions is now installed!";
fi

###############################################################################
# Clean up                                                                    #
###############################################################################

# Check if .zshrc-custom exists, if yes clean up .zshrc and make .zshrc-custom default
if [[ -e "/Users/$(whoami)/.zshrc-custom" ]];
then
	echo "Removing default .zshrc...";
	rm ~/.zshrc;
	echo "Replacing default .zshrc with .zshrc-custom...";
	mv ~/.zshrc-custom ~/.zshrc;
else
	echo $DOTFILE_STRING $OK_EMOJI ": Nothing to clean up!";
fi




