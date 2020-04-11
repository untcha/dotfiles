#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "defaults write com.if.Amphetamine 'Status Item Click' -int 2 && \
		 defaults write com.if.Amphetamine 'Start Session At Launch' -int 1 && \
		 defaults write com.if.Amphetamine 'Start Session On Wake' -int 1" \
	"Amphetamine"