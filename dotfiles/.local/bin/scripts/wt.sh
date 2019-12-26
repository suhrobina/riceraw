#!/usr/bin/env bash
# =============================================================================
#
# ████████ ██ ███    ███ ███████ ██████      ██   ██ ███████     ██  ██ ███████ 
#    ██    ██ ████  ████ ██      ██   ██     ██   ██ ██         ██  ███ ██      
#    ██    ██ ██ ████ ██ █████   ██████      ███████ ███████   ██    ██ ███████ 
#    ██    ██ ██  ██  ██ ██      ██   ██          ██      ██  ██     ██      ██ 
#    ██    ██ ██      ██ ███████ ██   ██          ██ ███████ ██      ██ ███████ 
#
# =============================================================================
#          FILE: wt.sh
#
#         USAGE: KEYBINDINGS:
#                   p or P: To pause the countdown.
#                   c or C: To resume the countdown.
#                   Esc or Ctrl+C: To stop the countdow.
#
#   DESCRIPTION: This script regulates working time
#
#  REQUIREMENTS: https://github.com/antonmedv/countdown
#
#        AUTHOR: Suhrob R. Nuraliev, LongOverdueVitalEnergy@Gmail.com
#     COPYRIGHT: Copyright (c) 2019
#       LICENSE: GNU General Public License
#       CREATED: 26 Dec 2019
# =============================================================================                                                       
while :
do
    countdown 45m && notify-send -t 60000 -u low "Timer 45/15" \
        "Working time is over, go take a rest!"
    countdown 15m && notify-send -t 60000 -u low "Timer 45/15" \
        "Start Working!"
clear

read -p "Press any key to RESTART timer..."

done
