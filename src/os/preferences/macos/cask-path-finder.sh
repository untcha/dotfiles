#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "defaults write com.cocoatech.PathFinder globalAppsMenuEnabled -int 0 && \
		 defaults write com.cocoatech.PathFinder kOpenTextEditDocumentsInTextEditor -int 0 && \
		 defaults write com.cocoatech.PathFinder kTerminalApplicationPath -string '/Applications/iTerm.app' && \
		 defaults write com.cocoatech.PathFinder textEditorApplicationPath -string '/Applications/Textastic.app'" \
	"Path Finder"