<p align="center">
  <img src="../../img/Alnoda-white.svg" alt="Alnoda logo" width="150">
</p>  

# Postgres workspace

Collection of tools to interact with PostgreSQL.  

Query, explore, manage, develop, test performance, import annd export data, 
generate mock data, create backups, manage migrations, generate reports, schedule tasks.

<p align="center">
  <img src="img/postgres-wid-collage.png" alt="Collage" width="750">
</p>


## Why this images

1. If you need a toolset to interact with PostgreSQL and you don't have time to build it on your own.

2. To directly access and manage PostgreSQL inside your kubernetes cluster.

3. A better PostgreSQL docker image for local dev environment. This is PostgreSQL with toolset in a single image.

4. You want to learn PostgreSQL features. 

## Start

```
docker run --name space-1 -d -p 8020-8040:8020-8040 alnoda/postgres-workspace
```

and open [localhost:8020](http://localhost:8020) in browser.  

## Features

**PostgreSQL 14 database**

**PostgreSQL tools:**

- Postgres CLI tools: 
    - [psql](https://www.postgresql.org/docs/current/app-psql.html) - standard PostgreSQL interactive terminal.
    - [pgcli](https://www.pgcli.com/) - command line interface for Postgres with auto-completion and syntax highlighting.
    - [pspg](https://github.com/okbob/pspg) - data visualizer (pager).
- Performance and load testing tools: 
    - [pgmetrics](https://pgmetrics.io/) - collect 350+ metrics from a running PostgreSQL server.
    - [pgCenter](https://github.com/lesovsky/pgcenter) - admin tool for observing and troubleshooting Postgres.
    - [pgbench](https://www.postgresql.org/docs/devel/pgbench.html) - run benchmark tests on PostgreSQL.
- Backups and restore tools:
    - [pg_dump](https://www.postgresql.org/docs/current/backup-dump.html) - generate a file with SQL commands that, when fed back to the server, will recreate the database.
    - [pg_dumpall](https://www.postgresql.org/docs/current/backup-dump.html) - back up each database in a given cluster, and also preserve cluster-wide data such as role and tablespace definitions.
    - [pg_restore](https://www.postgresql.org/docs/14/app-pgrestore.html) - utility for restoring a PostgreSQL database from an archive created by pg_dump.
- Tools to import/export data to/from Postgres:
    - [pgclimb](https://github.com/lukasmartinelli/pgclimb) - export data into different data formats, including CSV, JSON, templated HTML & Markdown.
    - [pgfutter](https://github.com/lukasmartinelli/pgfutter) - import CSV and line delimited JSON into PostgreSQL the easy way.
    - [pgloader](https://pgloader.readthedocs.io/en/latest/index.html) - very versatile data loading tool for PostgreSQL.
- Fake data generators and data mocking tools:
    - [synth](https://github.com/getsynth/synth) - a tool for generating realistic data.
    - [mock-data](https://github.com/faisaltheparttimecoder/mock-data) - generate mock data, tables and databases easily.
- Database change management toolset:
    - [sqitch](https://github.com/sqitchers/sqitch) - database change management application. 
    - [yuniql](https://github.com/rdagumampan/yuniql) - schema versioning and database migration engine.
    - [pgmigrate](https://github.com/yandex/pgmigrate) - database migration tool developed by Yandex.
    - [migra](https://databaseci.com/docs/migra) - find differences in database schemas easily.
- [pg_sample](https://github.com/mla/pg_sample) - create database sample while maintaining referential integrity.  
- [Postgres explain visualizer](https://github.com/AlexTatiyants/pev) - understand Postgres execution plans.
- [DBdesigner](https://github.com/akreienbring/dbdesigner) - draw ERD diagrams and use it to generate DDL code.
- [Schemaspy](https://github.com/schemaspy/schemaspy) - generate extensive HTML database documentation that looks great.
- [tbls](https://github.com/k1LoW/tbls)- generate documentation (essentially data catalog) from the database
- [pg_flame](https://github.com/mgartner/pg_flame) - flamegraph generator for Postgres explain output.

**Dev tools:**

- [**Eclipse Theia**](https://theia-ide.org/docs/) - open source version of popular Visual Studio Code IDE. Theia is trully open-source, has 
VS-Code extensions and works in browser. This means it can run inside a docker container on local machine or in cloud. A lot of beautiful color themes and many common plugins are already installed to save time.  
- [**Terminal**](https://github.com/tsl0922/ttyd) - secure browser-based terminal.
- [**FileBrowser**](https://github.com/filebrowser/filebrowser)  - manage files and folders inside the workspace, and exchange data between local environment and the workspace
- [**Cronicle**](https://github.com/jhuckaby/Cronicle)  - task scheduler and runner, with a web based front-end UI. It handles both scheduled, repeating and on-demand jobs, targeting any number of worker servers, with real-time stats and live log viewer.
- [**Static File Server**](https://github.com/vercel/serve) - view any static html sites as easy as if you do it on your local machine. Serve static websites easily.
- [**Ungit**](https://github.com/FredrikNoren/ungit) - rings user friendliness to git without sacrificing the versatility of it.
- [**MkDocs**](https://squidfunk.github.io/mkdocs-material/)  - create awesome documentation for your project with only markdown. 
- [**Midnight Commander**](https://midnight-commander.org/)  - feature rich visual file manager with internal text viewer and editor. 
- [**Process Monitor**](https://htop.dev/)  - Monitor running process and resource utilization. 
- Quicklaunch UI with getting started tutorial

Image is built from **Ubuntu 20.4** with the additional CLI apps

- [Zsh](https://www.zsh.org/), [Oh my Zsh](https://ohmyz.sh/)
- Python 3, Pip 
- Node/nodeenv
- curl, wget, telnet, jq
- **Git:** git, git-flow, lazygit 
- **File browsers:** mc, xplr
- **Text editors:** nano, vim, mcedit
- **System monitors:** ncdu, htop, glances, vizex
- **Process Control:** supervisord
- **Job scheduler:** cron
- [Rclone](https://rclone.org/) - save backups to S3

## Docs

See our guides on 

- [**getting started**](https://docs.alnoda.org/get-started/common-features/)
- [**workspace tutorial**](https://docs.alnoda.org/postgres-workspace/tutorial/) 
- [**project docs**](https://docs.alnoda.org/)

## Demo

<div align="center" style="font-style: italic;">
    Demo: Postgres workspace
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/postgres-workspace/img/postgres-wid-demo.gif" alt="postgres-wid-demo" width="750">
</p> 

