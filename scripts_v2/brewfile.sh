#!/bin/bash

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37
#printf "I ${RED}love${NC} Stack Overflow\n"


GREEN='\033[0;32m'
NC='\033[0m'
RED='\033[0;31m'
YELLOW='\033[0;33m'

packages=('clamav'
	  'git'
	  'jenv'
	  'mas'
	  'mpssh'
	  'screenresolution'
	  'topgrade'
	  'wget'
	  'zsh')


install_brew_packages() {
	# Update brew
	brew update

	# Install packages
	for i in ${!packages[@]}; do
		is_installed=true;
		( brew list --versions ${packages[$i]} > /dev/null) || is_installed=false;		

		if [[ $is_installed == true ]];
		then
			echo -e "--> ${GREEN}${packages[$i]}${NC}" "is already installed!";
		else
			echo -e "--> ${RED}${packages[$i]}${NC}" "is not installed!";
			echo -e "    Installing ${RED}${packages[$i]}${NC}";
			brew install ${packages[$i]};
			echo -e "    Successfully installed ${GREEN}${packages[$i]}${NC}";
		fi
	done
}
