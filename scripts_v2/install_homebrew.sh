#!/bin/bash

###############################################################################
# This script installs homebrew
###############################################################################

CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'
RED='\033[0;31m'
YELLOW='\033[0;33m'

me=$BASH_SOURCE;

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi

if [[ -e `which brew` ]]; then
	echo -e "${CYAN}Homebrew is already installed!${NC}";
else
	echo -e "${CYAN}Homebrew is not installed!${NC}";
	echo -e "${CYAN}Installing Homebrew...${NC}";
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	echo -e "${CYAN}Homebrew is now installed!${NC}";
fi

#read -p "Would you like to install brews? [y/n] " -n 1;
#read -p "$(echo -e $BOLD$YELLOW"foo bar "$RESET)" INPUT_VARIABLE
read -p $'\e[36mWould you like to install brew packages?\e[0m [\e[32my\e[0m/\e[31mn\e[0m]: ' -n 1;
echo
if [[ $REPLY =~ ^[Yy]$ ]];
then
	echo -e "${YELLOW}Installing brew packages...${NC}";
	source ./brewfile.sh
	install_brew_packages;
	echo -e "${YELLOW}All brew packages are now installed!${NC}";
fi
