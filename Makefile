all: install

install:    homebrew

# This target installs homebrew and (optional) some brews and casks defined in
# ./brew/brewfile.sh and
# ./brew/caskfile.sh
homebrew:
            scripts/brew.sh
