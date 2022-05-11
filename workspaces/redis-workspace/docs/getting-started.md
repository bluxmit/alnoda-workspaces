# Get started

This doc has examples how to use workspace to interact with Redis.  

In examples we use local Redis that is running inside the workspace, but the commands apply to any Redis instance.


## Tutorial

Open Quickstart page [http://localhost:800/](http://localhost:8020/) for quick access to all the tools 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/redis-workspace/img/Redis-wid.png" alt="Redis WID" width="750">
</p> 

Use workspace terminal [http://localhost:8026/](http://localhost:8026/) and load some Redis datasets 

```
git clone https://github.com/redis-developer/redis-datasets.git /home/project/redis-datasets
cat /home/project/redis-datasets/movie-database/import_actors.redis | redis-cli 
cat /home/project/redis-datasets/movie-database/import_movies.redis | redis-cli 
```

Open Redis Commander UI on [http://localhost:8029/](http://localhost:8029/) and explore Redis databases 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/redis-workspace/img/Rediscommander.png" alt="Redis commander" width="750">
</p> 

Alternatively use browser-based VS-code [http://localhost:8025/](http://localhost:8025/) with Redis extension

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/redis-workspace/img/Theia-redis.png" alt="Theia" width="750">
</p> 

In the Workspace terminal launch iredis CLI, get & set keys
```
iredis
iredis --newbie
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/redis-workspace/img/iredis.png" alt="Iredis" width="400">
</p> 

Create dump of the Redis database
```
redis-dump-go -h localhost > /home/redis-movie-dump.resp 
```
Use File Browser [http://localhost:8021](http://localhost:8021) to get the dump to your PC 
