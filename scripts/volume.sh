#!/bin/bash

if [[ "$1" = "0" ]]; then
    wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
elif [[ "$1" =  "+" ]]; then
    if [[ "$muteStatus" == *"MUTED"* ]]; then
	wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    fi
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "0.01+"
elif [[ "$1" = "-" ]]; then
    if [[ "$muteStatus" == *"MUTED"* ]]; then
	wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
    fi
    wpctl set-volume @DEFAULT_AUDIO_SINK@ "0.01-"
fi

muteStatus=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
currentVolume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | tr -dc '0-9'| sed 's/^0*//' |tr -d '\n')

if [[ "$muteStatus" == *"MUTED"* ]]; then
	dunstify -r 99099 --icon ~/.config/dunst/icons/mute_icon.svg -a "Volume" -h int:value:0 " muted"
else
	dunstify -r 99099 --icon ~/.config/dunst/icons/volume_icon.svg -a "Volume"  -h int:value:$currentVolume " $currentVolume %"
fi
