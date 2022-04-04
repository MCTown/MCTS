#!/bin/sh
set -o errexit

DOCKER_ARGS='--mount type=bind,source="$(pwd)",target=/workspace -u $(id -u):$(id -g) --rm mcts-runtime'

echo ====================BUILDING RUNTIME====================
docker build . -t mcts-runtime

if [ ! -e config.yml ]
then
    echo ==============GENERATING DEFAULT MCDR CONFIG==============
    eval docker run $DOCKER_ARGS python -m mcdreforged init
    sed -i 's/java -Xms1G -Xmx2G -jar minecraft_server.jar nogui/.\/start.sh/g' config.yml
fi

echo =================DOWNLOADING MINECRAFT==================
cd server
chmod +x start.sh
eval docker run $DOCKER_ARGS /dragonwell/bin/java -jar fabric-installer-0.10.2.jar server -mcversion 1.18.2 -downloadMinecraft
