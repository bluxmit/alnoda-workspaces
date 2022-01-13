# Redis workspace

Docker image with Redis, and many other tools that make development with Redis much more convenient.  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/redis-workspace/img/redis-wid-collage.png" alt="Collage">
</p>

```
docker run --name rwid-1 -d -p 8020-8035:8020-8035 alnoda/redis-workspace
```

open your browser on [http://localhost:8020](http://localhost:8020)

## Why

Substitute in your development `docker-compose.yaml` file standard redis image with this one, add port-mapping `-p 8020-8035:8020-8035`. 
Now in addition to Redis, you've got a whole set of tools with UIs, that allow you to explore you Redis database, get and set keys, import datasets, 
install Redis modules and more.  

__List of tools__

- [Eclipse Theia](https://theia-ide.org/docs/)
- [Redis extension for VS-Code](https://open-vsx.org/extension/cweijan/vscode-redis-client)
- [Iredis](https://github.com/laixintao/iredis)
- [Redis-dump](https://github.com/yannh/redis-dump-go)
- [Redis-Tui](https://github.com/mylxsw/redis-tui)
- [Redis-commander](https://github.com/joeferner/redis-commander#readme)

in addition - [the common workspace-in-docker toolset](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/workspace-in-docker). 


### Get started

Open workspace UI [http://localhost:800/](http://localhost:8020/) for quick access to all the tools 

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




