# MCTS

MCTown Server

## Usage

THe server can be installed by using docker or manually. Note that in both cases you still have to change the memory setting in `./server/start.sh` and agree to Mojang EULA.

### Docker

The recommended way to use this server is to use docker. Simply have docker installed and run `./install.sh`. It comes with a correct python and [Dragonwell17](https://dragonwell-jdk.io/). Run `./start.sh` to start the server.

There's also a pre-built docker image at [`xiaoyu2006/mct-runtime`](https://hub.docker.com/repository/docker/xiaoyu2006/mct-runtime/).

### Manual

Install `Java17` runtime with correct `JAVA_HOME` set. Also you need to install `Python3.6+` and [`mcdreforged`](https://pypi.org/project/mcdreforged/). Run `python -m mcdreforged` to start the server.
