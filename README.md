# MCTS

[MCTown](https://www.mctown.tech/)的服务端软件MCTS, 即MCTown Server。

版本号的规范是

1. 大版本对应麻将大更新，从1对应1.17开始
2. 小版本对应麻将小版本更新
3. patch版本对应上游mod的更新，推荐选最新的

比如`2.1.x`对应是`Minecraft 1.18.1`，请根据版本号寻找合适自己的MCTS版本。

## 安装

服务端官方支持仅支持基于Linux的Docker安装方法，请确保Docker已在运行状态。

MCTS有预先写好的安装脚本，只要在根目录下运行`./install.sh`即可。使用`./start.sh`在后台启动服务端，`docker attach minecraft`进入控制台，`CTRL+P` `CTRL+Q`退出。

注意修改`server/start.sh`中的-Xms和-Xmx至符合你电脑的内存（推荐 可用内存-1.5G）。

## 更新

`git pull`之后再次运行`./install.sh`即可。如果你添加/修改了什么导致冲突的话自己解决一下就好。
