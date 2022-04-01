#!/bin/sh
set -o errexit

echo ====================BUILDING RUNTIME====================
docker build . -t mcts-runtime

echo =================DOWNLOADING MINECRAFT==================
cd server
chmod +x start.sh
docker run --mount type=bind,source="$(pwd)",target=/workspace --rm mcts-runtime /dragonwell/bin/java -jar fabric-installer-0.10.2.jar server mcversion 1.18.2 -downloadMinecraft
