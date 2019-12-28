#!/usr/bin/env bash

# This is bound to PrintScreen by default, requires maim. It lets you
# choose the kind of screenshot to take, including copying the image or even
# highlighting an area to copy. scrotcucks on suicidewatch right now.
#
#   Orig Author: Luke Smith
# Forked Author: Suhrob R. Nuraliev

# Play sound one line function
PlaySound(){ paplay /usr/share/sounds/freedesktop/stereo/camera-shutter.oga & }
DELAY=0.2

case "$(printf "a selected area\\ncurrent window\\nfull screen\\na selected area (copy)\\ncurrent window (copy)\\nfull screen (copy)" | dmenu -fn "Iosevka:size=14" -sb "#756869" -l 6 -i -p "Screenshot which area?")" in
	"a selected area") sleep ${DELAY};maim -s pic-selected-"$(date '+%y%m%d-%H%M-%S').png";PlaySound ;;
	"current window") sleep ${DELAY};maim -i "$(xdotool getactivewindow)" pic-window-"$(date '+%y%m%d-%H%M-%S').png";PlaySound ;;
	"full screen") sleep ${DELAY};maim pic-full-"$(date '+%y%m%d-%H%M-%S').png";PlaySound ;;
	"a selected area (copy)") sleep ${DELAY};maim -s | xclip -selection clipboard -t image/png;PlaySound ;;
	"current window (copy)") sleep ${DELAY};maim -i "$(xdotool getactivewindow)" | xclip -selection clipboard -t image/png;PlaySound ;;
	"full screen (copy)") sleep ${DELAY};maim | xclip -selection clipboard -t image/png;PlaySound ;;
esac
