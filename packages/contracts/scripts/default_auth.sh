#!/bin/bash
set -euo pipefail
pushd $(dirname "$0")/..

export RPC_URL="http://localhost:5050"

export WORLD_ADDRESS=$(cat ./target/dev/manifest.json | jq -r '.world.address')

export HOME_ADDRESS=$(cat ./target/dev/manifest.json | jq -r '.contracts[] | select(.name == "autochessia::home::home" ).address')

echo "---------------------------------------------------------------------------"
echo world : $WORLD_ADDRESS
echo " "
echo home : $HOME_ADDRESS
echo "---------------------------------------------------------------------------"

# enable system -> component authorizations
COMPONENTS=("Creature" "Player" "Piece" "InningBattle")

for component in ${COMPONENTS[@]}; do
    sozo auth writer $component $HOME_ADDRESS --world $WORLD_ADDRESS --rpc-url $RPC_URL
done

echo "Default authorizations have been successfully set."
