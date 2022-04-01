#!/bin/sh

docker run --rm --name minecraft -dit --network host --mount type=bind,source="$(pwd)",target=/workspace mcts-runtime
