#!/usr/bin/env bash
# =============================================================================
#   ____            _           _      ____      _ _           _
#  |  _ \ _ __ ___ (_) ___  ___| |_   / ___|___ | | | ___  ___| |_ ___  _ __
#  | |_) | '__/ _ \| |/ _ \/ __| __| | |   / _ \| | |/ _ \/ __| __/ _ \| '__|
#  |  __/| | | (_) | |  __/ (__| |_  | |__| (_) | | |  __/ (__| || (_) | |
#  |_|   |_|  \___// |\___|\___|\__|  \____\___/|_|_|\___|\___|\__\___/|_|
#                |__/
# =============================================================================
#          FILE: p-collector.sh
#
#   DESCRIPTION: This script collects all project files/folders from separate
#                sources and synchronizes with the git folder. Preserves the
#                integrity of the .git folder
#
#        AUTHOR: Suhrob R. Nuraliev, LongOverdueVitalEnergy@Gmail.com
#     COPYRIGHT: Copyright (c) 2019
#       LICENSE: GNU General Public License
#       CREATED: 29 Oct 2019
# =============================================================================

# = SETTINGS ==================================================================

# NOTE it's important set correct path
SRC_ROOT_FOLDER="${HOME}"
SRC_TARGET_FILEPATHS="
	.calcurse/conf
	.config/dunst/dunstrc
	.config/fontconfig
	.config/gtk-3.0
	.config/neofetch
	.config/newsboat/config
	.config/nitrogen
	.config/nvim/spell
	.config/nvim/init.vim
	.config/sxhkd/sxhkdrc
	.config/vifm/colors
	.config/vifm/vifmrc
	.config/xfce4/terminal
	.config/compton.conf
	.config/user-dirs.dirs
	.fonts/joypixels-android.ttf
	.local/bin/scripts
	.local/share/color
	.local/share/figlet
	.local/share/riceraw
	.local/share/wallpapers
	.themes
	.bashrc
	.bash_logout
	.inputrc
	.profile
	.xinitrc
	.xprofile
"

# Git project folder. Note don't forget about trailing slash (add /).
DST_GIT_FOLDER="$HOME/Documents/Projects/riceraw/dotfiles"


# = PERFORM ===================================================================

# Go to source root folder
cd ${SRC_ROOT_FOLDER}

# Create TEMP folder
TEMP_FOLDER="$(mktemp -d /tmp/XXXXX)"

# Collect all files and directories into TEMP folder
cp --parents --recursive --preserve --update \
		${SRC_TARGET_FILEPATHS} ${TEMP_FOLDER}

# Push files and directories from TEMP folder into GIT
# project folder. Ignores .git directory in DST_GIT_FOLDER
rsync -havzP --delete --exclude ".git" "${TEMP_FOLDER}/" "${DST_GIT_FOLDER}"

# > IMPORTANT! (from rsync(1) man pages)
# > A trailing slash on the source changes this behavior to avoid creating an
# > additional directory level at the destination. You can think of a trailing /
# > on a source as meaning "copy the contents of this directory" as opposed to
# > "copy the directory by name", but in both cases the attributes of the
# > containing directory are transferred to the containing directory on the
# > destination. In other words, each of the following commands copies the
# > files in the same way, including their setting of the attributes of /dest/foo:
# > rsync -av /src/foo /dest
# > rsync -av /src/foo/ /dest/foo

# Delete TEMP folder
rm -rf ${TEMP_FOLDER}

echo
# read -p "Press ENTER to continue..."