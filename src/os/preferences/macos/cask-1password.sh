#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "defaults write com.agilebits.onepassword7 ShowItemCounts -int 1 && \
		 defaults write com.agilebits.onepassword7 LockOnMainAppExit -int 1 && \
		 defaults write com.agilebits.onepassword7 compromisedPasswordServiceV2 -int 1 && \
		 defaults write com.agilebits.onepassword7 autosave -int 0 && \
		 defaults write com.agilebits.onepassword7 HashSectionIsSortedFirst -int 1 && \
		 defaults write com.agilebits.onepassword7 ShowCopyJSONItemMenu -int 1 && \
		 defaults write com.agilebits.onepassword7 ShowCopyUUIDItemMenu -int 1" \
	"1Password (Settings)"