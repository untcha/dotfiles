#!/bin/bash

###############################################################################
# This script installs zsh (via homebrew), Oh-My-Zsh and iTerm 2 (via cask)
###############################################################################

me=$BASH_SOURCE;

DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/global_functions.sh";

###############################################################################
# Install zsh via homebrew and set zsh as default shell
###############################################################################

# Check if zsh is installed via homebrew; install if not
if [[ -e "/usr/local/bin/zsh" ]]; then
	echo "[$me]"$EMOJI_OK ": zsh is already installed via homebrew!";
else
	echo "[$me]"$EMOJI_NOK ": zsh is NOT installed!";
	echo "[$me]"$EMOJI_WRENCH ": Installing zsh via homebrew...";
	brew install zsh;
	brew install zsh-syntax-highlighting;
	echo "[$me]"$EMOJI_OK ": zsh is now installed!";
fi

# Check if zsh is default shell; make default shell if not
if [[ $SHELL = "/usr/local/bin/zsh" ]]; then
	echo "[$me]"$EMOJI_OK ": zsh is already the default shell!";
else
	echo "[$me]"$EMOJI_NOK ": zsh is NOT the default shell!";
	echo "[$me]"$EMOJI_WRENCH ": Setting zsh as default shell...";
	sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells" && chsh -s /usr/local/bin/zsh;
	echo "[$me]"$EMOJI_OK ": zsh is now the default shell!";
fi

###############################################################################
# Install Oh-My-Zsh and iTerm2
###############################################################################

# Check if Oh-My-Zsh is installed; install if not
if [[ -d "$HOME/.oh-my-zsh" ]]; then
	echo "[$me]"$EMOJI_OK ": Oh-My-Zsh is already installed!";
else
	echo "[$me]"$EMOJI_NOK ": Oh-My-Zsh is NOT installed!";
	echo "[$me]"$EMOJI_WRENCH ": Installing Oh-My-Zsh...";
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)";
	echo "[$me]"$EMOJI_OK ": Oh-My-Zsh is now installed!";
fi

# Check if iTerm2 is installed; install via homebrew cask if not
if [[ -e "/Applications/iTerm.app" ]]; then
	echo "[$me]"$EMOJI_OK ": iTerm2 is already installed!";
else
	echo "[$me]"$EMOJI_NOK ": iTerm2 is NOT installed!";
	echo "[$me]"$EMOJI_WRENCH ": Installing iTerm2...";
	brew cask install iterm2;
	echo "[$me]"$EMOJI_OK ": iTerm2 is now installed!";
fi

# Check if font "Meslo" is installed; install (copy from iTerm2 directory) if not
if [[ -e "$HOME/Library/Fonts/Meslo.otf" ]]; then
	echo "[$me]"$EMOJI_OK ": Font 'Meslo LG M DZ Regular for Powerline' is already installed!";
else
	echo "[$me]"$EMOJI_NOK ": Font 'Meslo LG M DZ Regular for Powerline' is NOT installed!";
	echo "[$me]"$EMOJI_WRENCH ": Installing 'Meslo LG M DZ Regular for Powerline'...";
	cp ./fonts/Meslo+LG+M+DZ+Regular+for+Powerline.otf $HOME/Library/Fonts;
	echo "[$me]"$EMOJI_OK ": Font 'Meslo LG M DZ Regular for Powerline' is now installed!";
fi

###############################################################################
# Further tweaking
###############################################################################

# Auto suggestions (for Oh My Zsh)
# Check if zsh-autosuggestions is installed; install if not
if [[ -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]]; then
	echo "[$me]"$EMOJI_OK ": zsh-autosuggestions is already installed!";
else
	echo "[$me]"$EMOJI_NOK ": zsh-autosuggestions is NOT installed!";
	echo "[$me]"$EMOJI_WRENCH ": Installing zsh-autosuggestions...";
	git clone git://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions;
	echo "[$me]"$EMOJI_OK ": zsh-autosuggestions is now installed!";
fi

###############################################################################
# Generate and modify .zshrc from template
###############################################################################
source "$DIR/generate_zshrc.sh";

echo "[$me]"$EMOJI_WRENCH ": Generating .zshrc...";
generate_zshrc;
echo "[$me]"$EMOJI_WRENCH ": Modifying .zshrc...";
modify_zshrc;
echo "[$me]"$EMOJI_OK ": All done!";
