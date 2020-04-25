#!/bin/bash

set -x
set -e
set -u

CSGO_PATH="${HOME}/csgo-ds"

update_csgo.sh

echo "*** Done updating. Generating configuration files"

for cfg_template in ${HOME}/files/cfg/*.tmpl
do
  template_string=$(cat $cfg_template)
  expanded_string=$(eval "echo \"${template_string}\"")
  template_dest=$(basename $cfg_template .tmpl)

  echo "$expanded_string" > ${CSGO_PATH}/csgo/cfg/$template_dest
done

echo "*** Starting the server"

cd ${CSGO_PATH}

./srcds_run -game csgo -autoupdate -console -usercon \
  +sv_setsteamaccount ${CSGO_GSLT_TOKEN} -net_port_try 1 \
  +ip 0.0.0.0 \
  -maxplayers_override 20

