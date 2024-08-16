#!/bin/bash

YABAIRC="$HOME/.yabairc"
SKHDRC="$HOME/.skhdrc"

if [[ $1 == "-a" ]]; then
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	brew install koekeishiya/formulae/yabai
	brew install koekeishiya/formulae/skhd
	brew install FelixKratz/formulae/borders
	shift
fi

if [[ $1 == "-d" ]]; then
	rm "$YABAIRC"
	rm "$SKHDRC"
	shift
fi

if [[ ! -f $YABAIRC ]]; then touch $YABAIRC ; cp .yabairc $YABAIRC ; fi
if [[ ! -f $SKHDRC ]]; then touch $SKHDRC ; cp .skhdrc $SKHDRC ; fi

if [[ $1 == "-v" ]]; then
	echo -e								\
"\
enable system integrity protection (SIP):				\n\
'csrutil enable --without fs --without debug --without nvram' 		\n\
after reboot, enable non-Apple signed arm64e binaries:			\n\
'sudo nvram boot-args=-arm64e_preview_abi'				\
"
fi

yabai --restart-service
skhd --start-service

