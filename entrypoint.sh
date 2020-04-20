#!/bin/bash

set -x
set -e

CSGO_PATH="${HOME}/csgo-dedicated"

echo "*** Updating CS:GO"
/usr/games/steamcmd +login anonymous +force_install_dir $CSGO_PATH +app_update 740 +quit

echo "*** Done updating. Launching the server"

# TODO