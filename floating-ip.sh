#!/bin/sh

set -eu

# Needed env-vars
# DIGITALOCEAN_ACCESS_TOKEN=<api for Digital ocean>
# FLOATING_IP=<the floating ip which you want assigned to this node>

if [ -f /run/secrets/DIGITALOCEAN_ACCESS_TOKEN ]; then
    export DIGITALOCEAN_ACCESS_TOKEN=$(cat /run/secrets/DIGITALOCEAN_ACCESS_TOKEN)
else
    export DIGITALOCEAN_ACCESS_TOKEN=${DIGITALOCEAN_ACCESS_TOKEN}
fi


export MY_IP=$(curl -s http://169.254.169.254/metadata/v1/id)

# Only for bash
#if [[ ! $MY_IP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
#    echo "MY_IP is not an IP, failing!"
#    exit 1
#fi

while true; do
    ./doctl compute floating-ip-action assign ${FLOATING_IP} ${MY_IP};
    sleep 120;
done
