# Yugabyte workspace

A set of tools to maintain, test, benchmark and deveolp with [Yugabyte](https://www.yugabyte.com/) - a distributed 
SQL database. 

## About 
This workspace was build from the [Postgres workspace](https://github.com/bluxmit/alnoda-workspaces/blob/main/workspaces/postgres-workspace/README.md), and 
includes all its features. In addition:
- [Yugabyte 2.11 release](https://github.com/yugabyte/yugabyte-db/releases)
- [tpccbenchmark](https://docs.yugabyte.com/latest/benchmark/tpcc-ysql/)
- [YugabyteDB workload generator](https://github.com/Yugabyte/yb-sample-apps)

Yugabyte release is in the folder `/opt/yugabyte` with `./bin and ./postgres/bin` added to the PATH.  

<p align="center">
  <img src="./img/yugabyte-binaries.jpg" alt="mc">
</p>

Postgres tools from the [Postgres workspace](https://github.com/bluxmit/alnoda-workspaces/blob/main/workspaces/postgres-workspace/README.md) 
work with Yugabyte too.

### tpccbenchmark
[tpccbenchmark](https://docs.yugabyte.com/latest/benchmark/tpcc-ysql/) runs the TPC-C workload against YugabyteDB YSQL. 
TPC-C is a popular online transaction processing benchmark that provides metrics you can use to evaluate the performance 
of YugabyteDB for concurrent transactions of different types and complexity that are either executed online or queued 
for deferred execution.  

Example of use

1. Create db for testing
```
pgcli -h yugabyte-tservers-ip -p 5433 -U yugabyte
>> CREATE DATABASE loadtest;
```

2. Configure tpccbenchmark
```
cd /opt/tpcc
nano config/workload_all.xml  # change <DBName> to loadtest
```

3. Prepare and execute load test
```
cd /opt/tpcc
./tpccbenchmark --create=true --nodes=yuga-yb-tservers loadtest

./tpccbenchmark --load=true \
  --nodes=yuga-yb-tservers \
  --warehouses=10 \
  --loaderthreads 20

./tpccbenchmark --execute=true \
  --nodes=yuga-yb-tservers \
  --warehouses=10
```

### YugabyteDB workload generator
[YugabyteDB workload generator](https://github.com/Yugabyte/yb-sample-apps) emulates various workloads against YugabyteDB.  

Help
```
cd /opt/yugabyte-workload-gen

java -jar yb-sample-apps.jar --help
```

Example of use
```
cd /opt/yugabyte-workload-gen

java -jar yb-sample-apps.jar \
    --workload SqlInserts \
    --nodes yugabyte-tservers-ip:5433 \
    --nouuid \
    --value_size 256 \
    --num_threads_read 16 \
    --num_threads_write  4 \
    --num_unique_keys 10000000
```