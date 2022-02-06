# Yugabyte workspace

A set of tools to maintain, test, benchmark and deveolp with [Yugabyte](https://www.yugabyte.com/) - a distributed 
SQL database. 

## About 
This workspace was build from the [Postgres workspace](https://github.com/bluxmit/alnoda-workspaces/blob/main/workspaces/postgres-workspace/README.md), and 
includes all its features. In addition:
- [Yugabyte 2.11 release](https://github.com/yugabyte/yugabyte-db/releases)
- [tpccbenchmark](https://docs.yugabyte.com/latest/benchmark/tpcc-ysql/)

Yugabyte release is in the folder `/opt/yugabyte` with `./bin and ./postgres/bin` added to the PATH.  

<p align="center">
  <img src="./img/yugabyte-binaries.jpg" alt="mc">
</p>

Postgres tools from the [Postgres workspace](https://github.com/bluxmit/alnoda-workspaces/blob/main/workspaces/postgres-workspace/README.md) 
work with Yugabyte too.
