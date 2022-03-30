#!/bin/sh
set -o errexit

echo ====================BUILDING RUNTIME====================
docker build . -t mct-runtime

echo =================DOWNLOADING MINECRAFT==================
cd server
chmod +x start.sh
java -jar fabric-installer-0.10.2.jar server -mcversion 1.18.2 -downloadMinecraft
