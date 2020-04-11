#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "defaults write com.if.Amphetamine 'Status Item Click' -int 2 && \
		 defaults write com.if.Amphetamine 'Start Session At Launch' -int 1 && \
		 defaults write com.if.Amphetamine 'Start Session On Wake' -int 1 && \
		 defaults write com.if.Amphetamine 'Always Ask to End For Low Battery' -int 1 && \
		 defaults write com.if.Amphetamine 'End Session On Low Battery' -int 1 && \
		 defaults write com.if.Amphetamine 'Ignore Battery on AC' -int 1 && \
		 defaults write com.if.Amphetamine 'Restart DD Session on AC Reconnect' -int 1 && \
		 defaults write com.if.Amphetamine 'Enable Session State Sound' -int 0" \
	"Amphetamine"

print_warning "Set 'Launch Amphetamine at Login' manually"