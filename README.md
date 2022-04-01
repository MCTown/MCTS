# MCTS

MCTown Server

## Usage

The server can be installed by using docker or manually.

### Docker

The recommended way to use this server is to use docker. Simply have docker installed and run `./install.sh`. It comes with a correct python with mcdreforged installed and [Dragonwell17](https://dragonwell-jdk.io/). Run `./start.sh` to start the server. It will launch the container detached with name `minecraft`.

There's also a pre-built docker image at [`xiaoyu2006/mcts-runtime`](https://hub.docker.com/repository/docker/xiaoyu2006/mcts-runtime/).

### Manual

Install `Java17` runtime with correct `JAVA_HOME` set. Also you need to install `Python3.6+` and [`mcdreforged`](https://pypi.org/project/mcdreforged/). You should also execute fabric-installer in `server` directory. Run `python -m mcdreforged` to start the server.
