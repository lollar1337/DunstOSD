#!/bin/bash

if [[ "$1" = "+" ]]; then
	sudo brightnessctl s 10%+
elif [[ "$1" = "-" ]]; then
	sudo brightnessctl s 10%-
fi

currentBrightness=$(brightnessctl -m | cut -c 26-28)

dunstify -r 99099 --icon ~/.config/dunst/icons/brightness_icon.svg -a "Volume"  -h int:value:$currentBrightness " $currentBrightness %"
