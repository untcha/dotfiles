#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

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
			echo -e "    installing ${RED}${packages[$i]}${NC}";
			brew install ${packages[$i]};
			echo -e "    successfully installed ${GREEN}${packages[$i]}${NC}";
		fi
	done
}
