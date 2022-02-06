# Yugabyte workspace

A set of tools to maintain, benchmark and deveolp with [Yugabyte](https://www.yugabyte.com/) - a distributed 
SQL database. 

## About 
This workspace was build from the [Postgres workspace](https://github.com/bluxmit/alnoda-workspaces/blob/main/workspaces/postgres-workspace/README.md), and 
includes all its features. In addition:
- [Yugabyte 2.11 release](https://github.com/yugabyte/yugabyte-db/releases)
- [tpccbenchmark](https://docs.yugabyte.com/latest/benchmark/tpcc-ysql/)

Yugabyte release is in the folder `/opt/yugabyte` with `./bin and ./postgres/bin` added to the PATH. 

__Postgres tools that work with Yugabyte:__
- CLI
    - [psql](https://www.postgresql.org/docs/current/app-psql.html). Standard PostgreSQL interactive terminal.
    - [pgcli](https://www.pgcli.com/). Command line interface for Postgres with auto-completion and syntax highlighting.
- Performance monitoring
    - [pgCenter](https://github.com/lesovsky/pgcenter). Admin tool for observing and troubleshooting Postgres.
- Backups
    - [pg_dump](https://www.postgresql.org/docs/current/backup-dump.html)
-Import/export data
    