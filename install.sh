#!/bin/sh
set -o errexit

DOCKER_ARGS='--mount type=bind,source="$(pwd)",target=/workspace -u $(id -u):$(id -g) --rm mcts-runtime'

echo ====================BUILDING RUNTIME====================
docker build . -t mcts-runtime

if [ ! -e config.yml ]; then
    echo ==============GENERATING DEFAULT MCDR CONFIG==============
    eval docker run $DOCKER_ARGS python -m mcdreforged init
    sed -i 's/java -Xms1G -Xmx2G -jar minecraft_server.jar nogui/.\/start.sh/g' config.yml
fi

echo =================DOWNLOADING MINECRAFT==================
cd server
if [ ! -e start.sh ]; then
    echo '$JAVA_HOME/bin/java -Xms2G -Xmx2G -XX:+UseG1GC -XX:+ParallelRefProcEnabled -XX:MaxGCPauseMillis=200 -XX:+UnlockExperimentalVMOptions -XX:+DisableExplicitGC -XX:+AlwaysPreTouch -XX:G1HeapWastePercent=5 -XX:G1MixedGCCountTarget=4 -XX:G1MixedGCLiveThresholdPercent=90 -XX:G1RSetUpdatingPauseTimePercent=5 -XX:SurvivorRatio=32 -XX:+PerfDisableSharedMem -XX:MaxTenuringThreshold=1 -XX:G1NewSizePercent=30 -XX:G1MaxNewSizePercent=40 -XX:G1HeapRegionSize=8M -XX:G1ReservePercent=20 -XX:InitiatingHeapOccupancyPercent=15 -Dusing.aikars.flags=https://mcflags.emc.gs -Daikars.new.flags=true -jar fabric-server-launch.jar nogui' > start.sh
fi
chmod +x start.sh
eval docker run $DOCKER_ARGS /dragonwell/bin/java -jar fabric-installer-0.10.2.jar server -mcversion 1.18.2 -downloadMinecraft
