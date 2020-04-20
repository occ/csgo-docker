#!/bin/bash

set -x
set -e
set -u

CSGO_PATH="${HOME}/csgo-ds"

echo "*** Updating CS:GO"
/usr/games/steamcmd +login anonymous +force_install_dir $CSGO_PATH +app_update 740 +quit
