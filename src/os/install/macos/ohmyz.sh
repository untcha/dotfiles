#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
		&& . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_oh-my-zsh() {
	
	if [ ! -e "$ZSH" ] || [ -z "$ZSH" ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" &> /dev/null
	fi
	
	print_result $? "Oh My Zsh"
	
}

customize_zshrc() {
	
	declare -r ZSHRC_PATH="$HOME/.zshrc"
	
	local zshAutosuggestionsPath="/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
	local zshSyntaxHighlightingPath="/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	# Uncomment '# ENABLE_CORRECTION="true"'
	if grep -q "# ENABLE_CORRECTION" "$ZSHRC_PATH"; then
		execute \
			"sed -i '' '/ENABLE_CORRECTION/s/^# //g' '$ZSHRC_PATH'" \
			"Uncommented: ENABLE_CORRECTION='true'" \
		
	fi
	# Comment '# ENABLE_CORRECTION="true"'
	# sed -i '' '/ENABLE_CORRECTION/s/^/# /g' "$ZSHRC_PATH";
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	# Uncomment '# COMPLETION_WAITING_DOTS="true"'
	if grep -q "# COMPLETION_WAITING_DOTS" "$ZSHRC_PATH"; then
		execute \
			"sed -i '' '/COMPLETION_WAITING_DOTS/s/^# //g' '$ZSHRC_PATH'" \
			"Uncommented: COMPLETION_WAITING_DOTS='true'" \
		
	fi
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	# Line number of the '# User configuration' line
	local lineNumber=$(grep -n "# User configuration" $ZSHRC_PATH | grep -Eo '^[^:]+')
	
	# Add 'export PATH="$HOME/.jenv/bin:$PATH"'
	#if ! grep -q 'export PATH="$HOME/.jenv/bin:$PATH"' "$ZSHRC_PATH"; then
	#	((lineNumber++))
	#	sed -i '' $lineNumber'i\
	#		export PATH="$HOME/.jenv/bin:$PATH"'$'\n' $ZSHRC_PATH
	#	
	#	print_success 'Added: export PATH="$HOME/.jenv/bin:$PATH"'
	#fi
	
	# Add 'eval "$(jenv init -)"'
	#if ! grep -q 'eval "$(jenv init -)"' "$ZSHRC_PATH"; then
	#	((lineNumber++))
	#	sed -i '' $lineNumber'i\
	#		eval "$(jenv init -)"'$'\n' $ZSHRC_PATH
	#	
	#	print_success 'Added: eval "$(jenv init -)"'
	#fi
	
	# Add 'export PATH="/usr/local/sbin:$PATH"'
	if ! grep -q 'export PATH="/usr/local/sbin:$PATH"' "$ZSHRC_PATH"; then
		((lineNumber++))
		sed -i '' $lineNumber'i\
			export PATH="/usr/local/sbin:$PATH"'$'\n' $ZSHRC_PATH
		
		print_success 'Added: export PATH="/usr/local/sbin:$PATH"'
	fi
	
	# Add 'export PATH="/usr/local/opt/curl/bin:$PATH"'
	if ! grep -q 'export PATH="/usr/local/opt/curl/bin:$PATH"' "$ZSHRC_PATH"; then
		((lineNumber++))
		sed -i '' $lineNumber'i\
			export PATH="/usr/local/opt/curl/bin:$PATH"'$'\n' $ZSHRC_PATH
		
		print_success 'Added: export PATH="/usr/local/opt/curl/bin:$PATH"'
	fi
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	# Uncomment '# export LANG=en_US.UTF-8'
	if grep -q "# export LANG=en_US.UTF-8" "$ZSHRC_PATH"; then
		execute \
			"sed -i '' '/LANG=en_US.UTF-8/s/^# //g' '$ZSHRC_PATH'" \
			"Uncommented: export LANG=en_US.UTF-8" \
		
	fi
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	# Line number of the 'export LANG=en_US.UTF-8' line
	local lineNumber=$(grep -n "export LANG=en_US.UTF-8" $ZSHRC_PATH | grep -Eo '^[^:]+')
	
	# Add 'export LC_ALL=en_US.UTF-8'
	if ! grep -q 'export LC_ALL=en_US.UTF-8' "$ZSHRC_PATH"; then
		((lineNumber++))
		sed -i '' $lineNumber'i\
			export LC_ALL=en_US.UTF-8'$'\n' $ZSHRC_PATH
		
		print_success 'Added: export LC_ALL=en_US.UTF-8'
	fi
	
	# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
	
	# Add 'source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh' to .zshrc
	if ! grep -q $zshAutosuggestionsPath "$ZSHRC_PATH"; then
		execute \
			"printf '\n%s' 'source $zshAutosuggestionsPath' | tee -a '$ZSHRC_PATH'" \
			"Added: zsh-autosuggestions.zsh" \
		
	fi
	
	# Add 'source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' to .zshrc
	if ! grep -q $zshSyntaxHighlightingPath "$ZSHRC_PATH"; then
		execute \
			"printf '\n%s' 'source $zshSyntaxHighlightingPath' | tee -a '$ZSHRC_PATH'" \
			"Added: zsh-syntax-highlighting.zsh" \
		
	fi
	
	source .zshrc
	
}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
	
	print_in_purple "\n   Oh My Zsh\n\n"
	
	install_oh-my-zsh
	
	brew_install "zsh-autosuggestions" "zsh-autosuggestions"
	brew_install "zsh-syntax-highlighting" "zsh-syntax-highlighting"
	
	customize_zshrc
	
}

main