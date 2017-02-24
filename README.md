# Alexander's dotfiles

![dotfiles](https://dl.dropboxusercontent.com/s/tja3mc4qs76wnv3/dotfiles.png)

## Installation
Dependencies needed for the installation:
- Command Line Tools (without Xcode)
``` bash
xcode-select --install
```

Simply clone the repo:
``` bash
git clone https://github.com/untcha/dotfiles.git ~/.dotfiles
```

Running `bootstrap.sh` will copy the following files to your home directory `~`
- `.zshrc-custom` (this is my custom `.zshrc` file)
- `.ssh/config` (this is my custom `ssh` configuration)

``` bash
cd ~/.dotfiles && ./bootstrap.sh
```

## Install Homebrew and Cask
``` bash
cd ~/.dotfiles/scripts && ./brew.sh
```

`brew.sh` will install homebrew and the following brews and casks:
- brew install fping
- brew install git
- brew install mas
- brew install mplayer
- brew install node
- brew install prettyping
- brew install python3
- brew install speedtest_cli
- brew install tree
- brew install tvnamer
- brew tap caskroom/cask
- brew tap caskroom/versions

## Install zsh, Oh-My-Zsh and iTerm2
``` bash
cd ~/.dotfiles/scripts && ./oh-my-zsh-iterm2.sh
```

## Install Java JDK and jenv
``` bash
cd ~/.dotfiles/scripts && ./java-jdk.sh
```

## Inspired by...
[Mathias Bynens](https://mathiasbynens.be/) and his [dotfiles repository](https://mths.be/dotfiles)
[Alberto Grespan](http://albertogrespan.com/) and his [dotfiles repository](https://github.com/albertogg/dotfiles)
[Hannes Juutilainen](http://obsoletesysadmin.wordpress.com/) and his [dotfiles repository](https://github.com/hjuutilainen/dotfiles)