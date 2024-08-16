#!/bin/bash

FILES=(			\
	".config"	\
	".vim" 		\
	".zprofile" 	\
	".skhdrc" 	\
	".yabairc" 	\
	".vimrc" 	\
	".zshrc"	\
)

for file in "${FILES[@]}"; do
	if [[ "$1" == "-i" ]]; then
		rsync -av --exclude='.git/' --exclude='spicetify' "$file" "$HOME"
	elif [[ "$1" == "-e" ]]; then
		rsync -av --exclude='.git/' --exclude='spicetify' "$HOME/$file" .
	fi
done

