#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

execute "defaults write com.if.Amphetamine 'Status Item Click' = 2 && \
		 defaults write com.if.Amphetamine 'Start Session At Launch' = 1 && \
		 defaults write com.if.Amphetamine 'Start Session On Wake' = 1" \
	"Amphetamine"