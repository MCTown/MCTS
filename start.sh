#!/bin/sh

docker run --rm -it --network host --mount type=bind,source="$(pwd)",target=/workspace mct-runtime
