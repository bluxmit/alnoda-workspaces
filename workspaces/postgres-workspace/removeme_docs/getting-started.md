# Getting started

## Intro

These tutorials demonstrates how to use Postgres workspace to explore and interact with Postgres.  

To start, open Quickstart page [http://localhost:8020/](http://localhost:8020/) for quick access to all the tools. 
Use terminal to execute commands from this tutorial.

## Postgres

The workspace includes Postgres 14 up and running. You can use it to experiment and try things before trying on the application database. 
Connection parameters: host - _localhost_, user - _abc_ (no password), database - _abc_.  

You can load sample database to check out the workspace features and applications. For example, load "usda" database

```
git clone https://github.com/morenoh149/postgresDBSamples /home/pg_dbs
cd /home/pg_dbs/usda-r18-1.0
createdb usda
psql -f usda.sql usda
#Explore data
pgcli usda
SELECT * FROM data_src
```

load Chinook database

```
cd /home/pg_dbs/chinook-1.4
createdb -E UTF8 chinook
psql -f Chinook_PostgreSql_utf8.sql -d chinook   
# Explore data
pgcli chinook
SELECT * FROM "Track"
```

load Adventureworks database

```
cd /home/pg_dbs/adventureworks/
unzip data.zip # this will unzip all csv to the current directory
psql -c "CREATE DATABASE \"adventureworks\";"
psql -d adventureworks < install.sql
# Explore data
pgcli adventureworks
SELECT * FROM sales.salesorderdetail
```

Further examples will use this local Postgres instance, but can easily applied to another Postgres database.

# VS-code & plugins

[Apache Theia](https://theia-ide.org/), a browser-based version of the VS-code, is part of the workspace. It has 
extensions to query Postgres  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/postgres-workspace/img/Theia connect.png" alt="Theia connect" width="750">
</p> 

If you loaded sample databases to the local Postgres, connect & explore data directly in the IDE

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/postgres-workspace/img/Theia explore data.png" alt="Theia explore" width="750">
</p> 

## Postgres CLI tools

Querying from command line can be awesome! 

### psql

[psql](https://www.postgresql.org/docs/14/app-psql.html) is a PostgreSQL interactive terminal

```
# connect to local Postgres
psql
# connect to database chinook (local Postgres)
psql chinook
# general psql connection pattern
psql postgresql://dbmaster:5432/mydb
# with password prompt
psql -U postgres -W postgresql://my-postgres-host:5432/mydb
$ without password prompt
PGPASSWORD=xxxxxxxxxxx psql -U postgres postgresql://my-postgres-host:5432/mydb
```

### pgcli
[pgcli](https://www.pgcli.com/) - is a postgres client that does auto-completion and syntax highlighting. 

```
# pgcli to the local Postgres 
pgcli 
# connect to database usda (local Postgres)
pgcli usda
# pgcli to the remote Postgres 
pgcli -h my-postgres-host -p 5432 -U postgres -W -d mydb
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/postgres-workspace/img/pgcli.png" alt="pgcli" width="750">
</p> 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/postgres-workspace/img/pspg.png" alt="pspg" width="750">
</p> 

### pspg

[Pspg](https://github.com/okbob/pspg) is a unix pager (with very rich functionality) designed for work with tables. 
Pspg is enabled by default, and will automatically applied to psql and pgcli if the result of SELECT statement is large. 
You can disable pspg by deleting the (last) line _PAGER='pspg -s 4 --interactive --no-mouse'_  from file /home/abc/.zshrc. 
(or you can modify configuration).


## Performance and load testing
Monitor live activity, collect and analyse metrics, perform load tests.

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/postgres-workspace/img/pgmetrics.png" alt="pgmetrics" width="500">
</p> 

### pgmetrics

[pgmetrics](https://pgmetrics.io/) is an open-source, zero-dependency, single-binary tool that can collect 350+ metrics from a running PostgreSQL 
server and display it in easy-to-read text format or export it as JSON and CSV for scripting.

```
# Try on local Postgres database "usda" (upon password prompt just hit Enter) 
pgmetrics --no-pager -h localhost -U abc usda 
# Remote Postgres 
pgmetrics --no-pager -h my-postgres-host -p 5432 -U postgres mydb
```

_Hint:_ Output to txt file `pgmetrics -h localhost -U abc usda >> /home/static-server/pgmetrics-usda.txt` and open static server [http://localhost:8022](http://localhost:8022)

### pgCenter

[pgCenter](https://github.com/lesovsky/pgcenter) is a command-line admin tool for observing and troubleshooting Postgres. 

```
# for local Postgres 
pgcenter top -h localhost -p 5432 -U abc -d usda
# for remote Postgres (password prompt)
pgcenter top -h my-postgres-host -p 5432 -U postgres -d mydb
# for remote Postgres (no password prompt)
PGPASSWORD=xxxxxxxxxxx pgcenter top -h my-postgres-host -p 5432 -U postgres -d mydb
```

### pgbench
[pgbench](https://www.postgresql.org/docs/devel/pgbench.html) is a simple program for running benchmark tests on PostgreSQL. 

```
# initialize 
pgbench -h localhost -U abc -i -s 50 abc
# test
pgbench -h localhost -U abc -c 10 -j 2 -t 10000 abc
```
Example use on remote Postgres:
```
# initialize 
pgbench -h my-postgres-host -U postgres -i -s 50 mydb
# test
pgbench -h my-postgres-host -U postgres -c 10 -j 2 -t 10000 mydb
```
__Learn more:__
- [Pgbench tutorial](https://www.cloudbees.com/blog/tuning-postgresql-with-pgbench). 


## Backups and restore
Create backup dumps with [pg_dump](https://www.postgresql.org/docs/current/backup-dump.html) or [pg_dumpall](https://www.postgresql.org/docs/14/app-pg-dumpall.html), 
push to S3 with [rclone](https://rclone.org/) and schedule with [Cronicle](https://github.com/jhuckaby/Cronicle).

### pgdump

The purpose of [pg_dump](https://www.postgresql.org/docs/current/backup-dump.html) is to generate a file with SQL commands that, 
when fed back to the server, will recreate the database in the same state as it was at the time of the dump.

```
mkdir /home/dumps/
# Dump from local Postgres
pg_dump -h localhost -p 5432 -U abc usda > /home/dumps/local_postgres_dump
# Dump from remote Postgres
PGPASSWORD=xxxxxxxxxxx pg_dump -h my-postgres-host -p 5432 -U postgres mydb > /home/dumps/remote_postgres_dump
# Restore from dump to local Postgres
psql dbname < /home/dumps/remote_postgres_dump
```

__Other versions of pg_dump__
The default pg_dump version is for Postgres 14. If you see error _error: aborting because of server version mismatch_, try 
pg_dump for your postgres version (currently Postgres versions 12, 13 and 14 are supported)

```
pg_dump_12 -h localhost -p 5432 -U abc abc > /home/dumps/local_postgres_dump_12
pg_dump_13 -h localhost -p 5432 -U abc abc > /home/dumps/local_postgres_dump_13
```

### pg_dumpall
[pg_dumpall](https://www.postgresql.org/docs/14/app-pg-dumpall.html) is a utility for writing out ("dumping") 
all PostgreSQL databases of a cluster into one script file. 

```
pg_dumpall -h localhost -p 5432 -U abc > /home/dumps/local_postgres_dumpall
# Dump from remote Postgres
PGPASSWORD=xxxxxxxxxxx pg_dump -h my-postgres-host -p 5432 -U postgres mydb > /home/dumps/remote_postgres_dump
# Restore from dump to local Postgres
psql dbname < /home/dumps/remote_postgres_dump
```

The default is pg_dumpall for Postgres 14, if you need earlier version, use `pg_dumpall_12`, `pg_dumpall_13`. 

### rclone

[rclone](https://rclone.org/) is a command line program to manage files on cloud storage. 
It is a feature rich alternative to cloud vendors' web storage interfaces.  
__Copy dump to S3:__  
Create file `~/.config/rclone/rclone.conf` with the following content

```
[remote]
type = s3
provider = AWS
access_key_id = XXXXXXXXXXXXXXXXXXXXXX
secret_access_key = XXxxXXxXXXxxxXXxXXXxxXXXxxxXXXxXXXX
region = xx-xxxx-x
```

Use Rclone to copy to S3 and delete from local

```
rclone move /home/dumps/ remote:my-s3-bucket/dumps/
```

__Restore from S3 to local:__
When there is a need to restore database from a dump, copy dupm from S3 or mount S3 bucket to local folder. 
In case of mounting, file will not be physically copied. Database restoration will happen directly from dump on S3.

```
# copy & restore
rclone copy remote:dwh-1/dumps/remote_postgres_dump /home/s3-dumps/
psql dbname < /home/s3-dumps/remote_postgres_dump
# mount & restore
rclone sync remote:dwh-1/dumps /home/s3-dumps
psql dbname < /home/s3-dumps/remote_postgres_dump
```

### scheduling backups

__Schedule with Cronicle__: open Cronicle WEB UI from the main Workspace page, or directly on [http://localhost:8023/](http://localhost:8023/) 
(user/pass - admin/admin) and create scheduled event (plugin - shell script). Provide commands to be executed.

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/postgres-workspace/img/Cronicle2.png" alt="Cronicle" width="750">
</p> 

## Database sample

Who hasn't faced a need to make a sample database for testing/development purposes? :-)

```
# Create sample from database "usda" in local Postgres
pg_sample -h localhost -U abc --limit=500 --file=/home/project/sample_db.sql usda
# create new database (local Postgres)
createdb usda_sample
# restore sample to the new database
psql usda_sample < /home/project/sample_db.sql 
```

## Data import/export

Import data from various files, export to csv, json, html. Download with [Filebrowser](https://github.com/filebrowser/filebrowser), 
upload to S3 with [Rclone](https://rclone.org/), schedule with [Cronicle](https://github.com/jhuckaby/Cronicle).

### pgclimb
[pgclimb](https://github.com/lukasmartinelli/pgclimb) is a PostgreSQL utility to export data into different data formats with support for templates. 

```
# From local Postgres instance
pgclimb --host localhost --port 5432 --dbname abc --username abc --query "SELECT * FROM distributors" -o /home/project/distributors.csv csv
# From remote Postgres instance
pgclimb --host my-postgres-host --port 5432 --dbname mydb --username postgres --password xxxxxxxxxxx --query "SELECT * FROM phonebook" -o /home/project/phone.csv csv
pgclimb --host my-postgres-host --port 5432 --dbname mydb --username postgres --password xxxxxxxxxxx --query "SELECT * FROM phonebook" -o /home/static-server/phone.html html
```

### pgfutter
[pgfutter](https://github.com/lukasmartinelli/pgfutter) helps to import CSV and line delimited JSON into PostgreSQL the easy way.  
For example, create file `/home/project/friends.json` with the following content

```json
{"name": "Jacob", "age": 26, "friends": ["Anthony"]}
{"name": "Anthony", "age": 25, "friends": []}
{"name": "Emma", "age": 28, "friends": ["Jacob", "Anthony"]}
```

Import data to Postgres

```
# to the local Postgres
pgfutter --host localhost --port 5432 --dbname abc --username abc --table friends json /home/project/friends.json
# to the remote Postgres
pgfutter --host my-postgres-host --port 5432 --dbname mydb --username postgres --pass admin --schema imports --table friends json /home/project/friends.json
```

Another example: create file `/home/project/friends2.csv` with the following content

```
name,age,friends
Jacob,26,"Anthony"
Anthony,25,""
Emma,28,"Jacob,Anthony"
```

Import data to Postgres

```
pgfutter --host my-postgres-host --port 5432 --dbname mydb --username postgres --pass admin --schema public --table friends2 csv /home/project/friends2.csv
```

### PGLoader

[PGLoader](https://pgloader.readthedocs.io/en/latest/index.html) - a very versatile data loading tool for PostgreSQL. 
Load data from files, or migrate entire databases to Postgres.   

Example of use: create test load file `/home/project/test.csv` with the following content

```
Header, with a © sign
"2.6.190.56","2.6.190.63","33996344","33996351","GB","United Kingdom"
"3.0.0.0","4.17.135.31","50331648","68257567","US","United States"
"4.17.135.32","4.17.135.63","68257568","68257599","CA","Canada"
"4.17.135.64","4.17.142.255","68257600","68259583","US","United States"
"4.17.143.0","4.17.143.15","68259584","68259599","CA","Canada"
"4.17.143.16","4.18.32.71","68259600","68296775","US","United States"
```

Create PGLoader file `/home/project/test.load` with the following content (use your postgres connection arguments)

```
LOAD CSV
     FROM '/home/project/test.csv' (x, y, a, b, c, d)
     -- local Postgres
     INTO postgresql://abc@localhost:5432/abc?csv (a, b, d, c)
     -- remote Postgres
     -- INTO postgresql://user:password@my-postgres-host:5432/mydb?csv (a, b, d, c)

     WITH truncate,
          skip header = 1,
          fields optionally enclosed by '"',
          fields escaped by double-quote,
          fields terminated by ','

      SET client_encoding to 'latin1',
          work_mem to '12MB',
          standard_conforming_strings to 'on'

   BEFORE LOAD DO
    $$ drop table if exists csv; $$,
    $$ create table csv (
        a bigint,
        b bigint,
        c char(2),
        d text
       );
  $$;
```

Load data into new table called "csv"

```
pgloader /home/project/test.load
```


## Data generators/mocking
Generate realistic data for existing tables, create new mock tables or databases.

### Synth

[Synth](https://github.com/getsynth/synth) is a tool for generating realistic data using a declarative data model. Synth is database agnostic and can scale to millions of rows of data. 

Create dir `mkdir /home/project/synth` and create file `/home/project/synth/companies.json` with the following contents

```json
{
    "type": "array",
    "length": {
        "type": "number",
        "constant": 1
    },
    "content": {
        "type": "object",
        "company_id": {
            "type": "number",
            "id": {}
        },
        "company_name": {
            "type": "string",
            "faker": {
                "generator": "company_name"
            }
        }
    }
}
```

Generate data (2 entries only) as json - `synth generate /home/project/synth/ --size 2 | jq`. 
Generate data into (local) Postgres

```
# Create table users in local Postgres database
echo "CREATE TABLE companies(company_id SERIAL PRIMARY KEY, company_name VARCHAR(255) NOT NULL);" | psql
# generate random data to table users
synth generate /home/project/synth/ --size 200 --to postgres://abc@localhost:5432/abc
# check 10 records
echo "SELECT * FROM companies LIMIT 10" | psql
```

__Learn more:__
- [Synth docs](https://www.getsynth.com/docs/getting_started/synth)
- [How to Create PostgreSQL Test Data](https://www.getsynth.com/docs/blog/2021/03/09/postgres-data-gen)

### mock-data

The idea behind [mock-data](https://github.com/faisaltheparttimecoder/mock-data)is to allow users to test database queries with sets of fake data in any pre-defined table. 

```
# Create table in (local) Postgres
echo "CREATE TABLE distributors (did integer, name varchar(40));" | psql
# Populate (local) Postgres with fake data (2000 rows)
mock tables -t "distributors" -r 2000 --uri="postgres://abc@localhost:5432/abc?sslmode=disable"
```

__Learn more:__
- [Mock-data documentation](https://github.com/faisaltheparttimecoder/mock-data/wiki)


## Database change management
Implement database change management in your team and drive higher software delivery and organizational performance.

### sqitch

[sqitch](https://github.com/sqitchers/sqitch) - is a database change management application. 
To demonstrate (very briefly) how Sqitch works, create a new database called 'flipr_test' in the local Postgres:

```
createdb flipr_test
```

Initialize and configure a Sqitch project, called 'flipr'

```
mkdir /home/project/flipr && cd /home/project/flipr
sqitch init flipr --engine pg
```

Open file `/home/project/flipr/sqitch.conf` and update configuration for the "pg" engine to conect to local Postgres as following

```
[core]
	engine = pg
[engine "pg"]
	target = db:pg:
	client = psql
``` 

Create database and changes to be managed by Sqitch

```
# create new Postgres database 
createdb flipr_test
# create sqitch change
sqitch add appschema -n 'Add schema for all flipr objects.'
# add SQL command to change file
echo "CREATE SCHEMA flipr;" >> /home/project/flipr/deploy/appschema.sql
# add SQL command to change-revert file
echo "DROP SCHEMA flipr;" >> /home/project/flipr/revert/appschema.sql
```

Apply db change with Squitch

```
sqitch deploy db:pg:flipr_test
```

Connet to local Postgres, database 'flipr_test' and check schema 'flipr' was created

```
pgcli flipr_test
SELECT schema_name FROM information_schema.schemata
```

Now you can open terminal back, and revert this change with the command `sqitch revert db:pg:flipr_test`.  

__Learn more__:
- [Sqitch Postgres tutorial](https://sqitch.org/docs/manual/sqitchtutorial/)

### yuniql

[Yuniql](https://github.com/rdagumampan/yuniql) is a data platform devops tool using migration-based and database-first 
delivery model. Migration-based as each changeset to the schema and seed data is a set of carefully prepared scripts 
controlled with a version number.  
To briefly demonstrate how Yuniql works, clone example Yuniql project

```
git clone https://github.com/rdagumampan/yuniql.git /home/project/yuniql
```

Create new database in the local Postgres instance

```
createdb helloyuniql
```

Apply to the local Postgres a Yuniql project in `/home/project/yuniql/samples/basic-postgresql-sample`

```
export YUNIQL_PLATFORM="postgresql"
export YUNIQL_WORKSPACE="/home/project/yuniql/samples/basic-postgresql-sample"
export YUNIQL_CONNECTION_STRING="Host=localhost;Port=5432;Username=abc;Password=;Database=helloyuniql"
```

Finally, run migrations

```
cd /home/project/yuniql/samples/basic-postgresql-sample
yuniql run -a --platform postgresql
```

Check the results

```
pgcli helloyuniql
SELECT * FROM regions
```

### migra

[migra](https://databaseci.com/docs/migra) is a schema comparison tool for PostgreSQL. 
Find differences in database schemas as easily as running a diff on two text files.
Migra makes schema changes almost automatic. Management of database migration deployments becomes much easier, 
faster, and more reliable. For example, compare two local Postgres databases

```
migra postgresql://abc:@localhost:5432/abc postgresql://abc:@localhost:5432/helloyuniql --unsafe
```

Migra will produce a set of SQL commands to make database "abc" have the same DDL as databas "helloyuniql". 


## Visualization tools

### dbdesigner
[dbdesigner](https://github.com/akreienbring/dbdesigner) a visual tool to create entity relationship diagrams and 
generate Postgres DDL code. Open dbdesigner from the Quickstart page.

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/postgres-workspace/img/dbdesigner.png" alt="dbdesigner" width="750">
</p> 

### schemaspy

[schemaspy](https://github.com/schemaspy/schemaspy) generates complete database documentation that looks great.

```
schemaspy -h localhost -p 5432 -d usda -u abc -o /home/static-server/usda-schemaspy
```

And open static file server on [http://localhost:8022/](http://localhost:8022/) folder usda-schemaspy

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/postgres-workspace/img/schemaspy.gif" alt="schemaspy" width="750">
</p> 

### Postgres explain visualizer

[Pev](https://github.com/AlexTatiyants/pev) helps to understand Postgres execution plans

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/postgres-workspace/img/pev.gif" alt="pev" width="750">
</p> 

### tbls

[tbls](https://github.com/k1LoW/tbls) - a tool for document a database, written in Go.
For example, generate Markdown docs  

```
tbls doc "postgres://abc@localhost:5432/usda?sslmode=disable" /home/static-server/usda-tbls
```

Now you can push these docks push to Github.

### pg_flame 

[pg_flame](https://github.com/mgartner/pg_flame) - a flamegraph generator for Postgres EXPLAIN ANALYZE output.

```
psql usda -qAtc 'EXPLAIN (ANALYZE, FORMAT JSON) SELECT *
   FROM nut_data N
   JOIN food_des F ON F.ndb_no = N.ndb_no
   JOIN datsrcln D ON D.nutr_no = N.nutr_no
   LEFT JOIN data_src ON data_src.datasrc_id = D.datasrc_id
   WHERE N.nutr_val > 20
       AND data_src.year > 1975 AND data_src.year < 1986;' \
    | pg_flame > /home/static-server/flamegraph.html
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/postgres-workspace/img/pgflame.png" alt="pgflame" width="750">
</p> 

## Other useful tools

### pg_insights

Convenient SQL for monitoring Postgres database health. Clone repo and use it to analyse Postgres databases

```
git clone https://github.com/lob/pg_insights /home/pg_insights
```

### sqlfluff

[Sqlfluff](https://www.sqlfluff.com/) is a moduler sql linter for humans.

```
echo "select * from t where id=1" >/tmp/test.sql
sqlfluff lint /tmp/test.sql
```

Results in:

```
== [/tmp/test.sql] FAIL
L:   1 | P:   1 | L044 | Query produces an unknown number of result columns.
L:   1 | P:  27 | L006 | Missing whitespace before =
L:   1 | P:  27 | L006 | Missing whitespace after =
```

