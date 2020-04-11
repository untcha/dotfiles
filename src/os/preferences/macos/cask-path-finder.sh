#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "defaults write com.cocoatech.PathFinder globalAppsMenuEnabled -int 0 && \
		 defaults write com.cocoatech.PathFinder kOpenTextEditDocumentsInTextEditor -int 0 && \
		 defaults write com.cocoatech.PathFinder kTerminalApplicationPath -string '/Applications/iTerm.app' && \
		 defaults write com.cocoatech.PathFinder textEditorApplicationPath -string '/Applications/Textastic.app' && \
		 defaults write com.cocoatech.PathFinder PFShowsUndoPanel -int 0 && \
		 defaults write com.cocoatech.PathFinder kArrowKeysLoopAround -int 1 && \
		 defaults write com.cocoatech.PathFinder kCommandClickOpenBehavior -int 1 && \
		 defaults write com.cocoatech.PathFinder kRevealInPathFinderBehaviorPrefKey -int 2 && \
		 defaults write com.cocoatech.PathFinder useBase2MathForSizes -int 1 && \
		 defaults write com.cocoatech.PathFinder kReturnKeyStartsRename -int 1 && \
		 defaults write com.cocoatech.PathFinder hideTabBarForSingleTab -int 0 && \
		 defaults write com.cocoatech.PathFinder useLargeAppearanceMode -int 1" \
	"Path Finder"

# defaults delete com.cocoatech.PathFinder kNTNewWindowsViewType && \