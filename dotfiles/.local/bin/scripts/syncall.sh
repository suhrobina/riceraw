#!/usr/bin/env bash
# =============================================================================
#          FILE: syncall.sh
#
#   DESCRIPTION: This script synchronize server folder with local folder
#
#        AUTHOR: Suhrob R. Nuraliev, LongOverdueVitalEnergy@Gmail.com
#     COPYRIGHT: Copyright (c) 2019
#       LICENSE: GNU General Public License
#       CREATED: 21 Oct 2019
# =============================================================================

# -- MyTetra Sync -------------------------------------------------------------
# echo "(MyTetra)LOCAL > > > > > > FILE_SERVER"
# rsync -havz --delete /home/suhrob/MyTetra/data suhrob@192.168.100.6:/home/suhrob/sync/mytetra.data
# echo

# -- Notable Sync -------------------------------------------------------------
# echo "(Notable)LOCAL > > > > > > FILE_SERVER"
# rsync -havz --delete /home/suhrob/.notable suhrob@192.168.100.6:/home/suhrob/sync
# echo

# -- Projects folder Sync -----------------------------------------------------
echo "(Notable)LOCAL > > > > > > FILE_SERVER"
rsync -havz --delete /home/suhrob/Documents/Projects suhrob@192.168.100.6:/home/suhrob/sync
echo

# -- Calcurse Sync ------------------------------------------------------------
# echo "(calcurse)LOCAL > > > > > > FILE_SERVER"
# rsync -havz --delete /home/suhrob/.calcurse suhrob@192.168.100.6:/home/suhrob/sync
# echo

echo
# read -p "Press ENTER to continue..."
