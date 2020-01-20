#!/usr/bin/env bash
#         _       _ _
#   __  _(_)_ __ (_) |_ _ __ ___
#   \ \/ / | '_ \| | __| '__/ __|
#  _ >  <| | | | | | |_| | | (__
# (_)_/\_\_|_| |_|_|\__|_|  \___|
#
# .xinitrc runs automatically when we run startx

# Map CAPSLOCK to ESCAPE
setxkbmap -option caps:escape
# xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'

# Load monitor calibration profile
#xcalib -d :0 .local/share/color/AUO_B140HAN01.3-26.icm

# Pointer Devices configuration script
pointer-devices.sh

# Speed xrate up
xset r rate 300 50

# Wallpapper restore. Must select a picture with nitrogen.
nitrogen --restore

# dwm status bar refresh script
dwm_bar.py &

# Power Manager
power-manager.sh &

dunst &                      # Notification daemon
sxhkd &	                     # Bind keys
#unclutter -grab &            # Remove mouse when idle
compton &                    # Transparency

fbxkb &                      # Keyboard indicator and switcher
#stardict & 	             # Dictionary
remmina -i &                 # Connect to remote desktops through the applet menu
blueman-applet &             # Bluetooth Manager
redshift-gtk &               # Color temperature adjustment tool
nm-applet &                  # Network Manager
~/.joplin/Joplin.AppImage &  # Note taking app
sleep 2 && telegram &        # Messenger

# Welcome Notification
notify-send "Welcome to RiceRAW on Linux with DWM!" "Press SUPER+F1 for the help."

# Start WM
exec dwm
