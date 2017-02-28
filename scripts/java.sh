#!/bin/bash

###############################################################################
# This script installs Java JDK 7 and Java JDK 8 (via cask),
# jenv (via homebrew) and configures jenv
###############################################################################

me=$BASH_SOURCE;

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
	source "$DIR/global_functions.sh";

###############################################################################
# Install Java JDK 7 and Java JDK 8
###############################################################################

# Check if Java JDK 7 is installed; install if not
if ls /Library/Java/JavaVirtualMachines/jdk1.7.* 1> /dev/null 2>&1;
then
	echo "[$me]"$EMOJI_OK ": Java JDK 7 is already installed!";
else
	echo "[$me]"$EMOJI_NOK ": Java JDK 7 is NOT installed!";
	echo "[$me]"$EMOJI_WRENCH ": Installing Java JDK 7...";
	brew update;
	brew cask install java7;
	echo "[$me]"$EMOJI_OK ": Java JDK 7 is now installed!";
fi

# Check if Java JDK 8 is installed; install if not
if ls /Library/Java/JavaVirtualMachines/jdk1.8.* 1> /dev/null 2>&1;
then
	echo "[$me]"$EMOJI_OK ": Java JDK 8 is already installed!";
else
	echo "[$me]"$EMOJI_NOK ": Java JDK 8 is NOT installed!";
	echo "[$me]"$EMOJI_WRENCH ": Installing Java JDK 8...";
	brew update;
	brew cask install java;
	echo "[$me]"$EMOJI_OK ": Java JDK 8 is now installed!";
fi

###############################################################################
# Install and configure jenv
###############################################################################

exec zsh

echo "[$me]"$EMOJI_WRENCH ": Installing jenv...";
brew update;
brew install jenv;

# Get installed JDK versions
JDK7=$(ls /Library/Java/JavaVirtualMachines | grep jdk1.7);
JDK8=$(ls /Library/Java/JavaVirtualMachines | grep jdk1.8);

JDK7_PATH=$'/Library/Java/JavaVirtualMachines/'${JDK7}'/Contents/Home/'
JDK8_PATH=$'/Library/Java/JavaVirtualMachines/'${JDK8}'/Contents/Home/'

# Configure jenv
jenv add $JDK7_PATH;
jenv add $JDK8_PATH;
jenv rehash

###############################################################################
# Install brews who need Java
###############################################################################
brew update;
brew install ant;
brew install bazel;
brew install maven;

brew cleanup && brew doctor;
