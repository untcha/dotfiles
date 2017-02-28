all: install

install:    homebrew \
			shell \
			java \
			ssh-config \

# This target installs homebrew and (optional) some brews and casks defined in
# ./brew/brewfile.sh and
# ./brew/caskfile.sh
homebrew:
			scripts/brew.sh

# This target installs zsh (via homebrew), Oh-My-Zsh and iTerm 2 (via cask)
shell:
			scripts/shell.sh

# This script installs Java JDK 7 and Java JDK 8 (via cask),
# jenv (via homebrew) and configures jenv
java:
			scripts/java.sh

# This target generates the ssh config file from the .ssh.config template
ssh-config:
			source scripts/generate_ssh.sh && generate_ssh_config