#!/bin/bash

/bin/bash ~/scripts/dualmon.sh &
/bin/bash ~/scripts/dwm_refresh.sh &
/bin/bash ~/scripts/onedrive_auto.sh &
sleep 1
/bin/bash ~/scripts/wp_autochange.sh &

# ruanjian
fcitx5 &
clash &
/bin/bash ~/scripts/autostart-apps.sh &

~/scripts/autostart_wait.sh

