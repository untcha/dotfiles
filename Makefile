all: install

install:    homebrew \
            shell \

# This target installs homebrew and (optional) some brews and casks defined in
# ./brew/brewfile.sh and
# ./brew/caskfile.sh
homebrew:
			scripts/brew.sh

# This target installs zsh (via homebrew), Oh-My-Zsh and iTerm 2 (via cask)
shell:
			scripts/shell.sh
