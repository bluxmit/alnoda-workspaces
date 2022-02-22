# SQLite Workspace

Collection of tools to work with SQLite.   

Helps to get started fast locally, because SQLite and toolset are already installed and configured. It is only needed 
to start a container.  

Also can be self-hosted and used for collaboration when developing embedded database. 

__Try it out:__

```
docker run --name space-1 -d -p 8020-8035:8020-8035 alnoda/sqlite-workspace
```
Open [localhost:8020](http://localhost:8020)


## Features

__SQLite Features:__

1. [sqlean](https://github.com/nalgeon/sqlean). The ultimate set of compiled SQLite extensions.
2. [sqlite-web](https://github.com/coleifer/sqlite-web). Web-based SQLite database browser.
3. [litecli](https://github.com/dbcli/litecli). CLI for SQLite.
4. [sqlite-viewer](https://github.com/inloop/sqlite-viewer). View SQLite file online.
5. [Web-GUI-for-SQLite](https://github.com/cyrilbois/Web-GUI-for-SQLite). Alternative tool to view SQLite file online.
6. [DBdesigner](https://github.com/akreienbring/dbdesigner). Draw ERD diagrams and use it to generate DDL code.
7. [tbls](https://github.com/k1LoW/tbls). Generate documentation (essentially data catalog) from the database

__Workspace Features:__

1. [Browser-based VS-code](https://theia-ide.org/) with extensions:   
    - [PostgreSQL Client for vscode](https://open-vsx.org/extension/cweijan/vscode-postgresql-client2)
    - [SQLTools PostgreSQL](https://open-vsx.org/extension/mtxr/sqltools-driver-pg)
2. Browser-based terminal. Finally no need to ssh into a running docker container.
3. [Cronicle](https://github.com/jhuckaby/Cronicle). Browser-based jobs scheduler. Schedule backups, data extracts, maintenance scripts.
4. Ubuntu with many apps installed: 
    - text editors 
    - [Zsh](https://ohmyz.sh/)
    - cron
    - mc
    - and many more
5. [Rclone](https://rclone.org/). Save SQLite databases to S3.
6. Programming languages. Develop/execute directly inside the workspace using browser-based IDE.
    - python
    - nodejs
7. [Filebrowser](https://github.com/filebrowser/filebrowser). Browse and download files (finally no need to mount folders for that).
8. [Static file server](https://github.com/vercel/serve). View generated HTML reports.
9. [Ungit](https://github.com/FredrikNoren/ungit). The easiest way to use git.
10. Browser-based process and resource utilization monitor
11. [Mkdocs](https://www.mkdocs.org/). Create documentation with Markdown.
12. Workspace own UI, from which you can open all applications and documentation.

## Get started

### Sqlite 

SQLite3 is installed. Open terminal [http://localhost:8026/](http://localhost:8026/) and execute

```
sqlite3
```

__Note:__ tcheck out a better CLI [litecli](#litecli) 


### Sqlite extensions

The following compiled extensions are present in the folder `/home/sqlite-extensions`

- [crypto](https://github.com/nalgeon/sqlean/blob/main/docs/crypto.md): secure hashes
- [fileio](https://github.com/nalgeon/sqlean/blob/main/docs/fileio.md): read and write files
- [fuzzy](https://github.com/nalgeon/sqlean/blob/main/docs/fuzzy.md): fuzzy string matching and phonetics
- [ipaddr](https://github.com/nalgeon/sqlean/blob/main/docs/ipaddr.md): IP address manipulation
- [re](https://github.com/nalgeon/sqlean/blob/main/docs/re.md): regular expressions
- [stats](https://github.com/nalgeon/sqlean/blob/main/docs/stats.md): math statistics
- [text](https://github.com/nalgeon/sqlean/blob/main/docs/text.md): string functions
- [unicode](https://github.com/nalgeon/sqlean/blob/main/docs/unicode.md): Unicode support
- [uuid](https://github.com/nalgeon/sqlean/blob/main/docs/uuid.md): Universally Unique IDentifiers

Example start SQLite, and load extension: 

```
sqlite3
.load /home/sqlite-extensions/stats
```

### [sqlite-web](https://github.com/coleifer/sqlite-web)

Serve any SQLite database. There is a port assigned - 8033. Use this port to start sqlite-web for your database. 
Workspace UI has a shorcut to quickly open sqlite-web running on port 8033.

Example, start sqlite-web on port 8033 for SQLite database file `/home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite`

```
sqlite_web /home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite --host 0.0.0.0 --port 8033 
```

and with extensions loaded:

```
sqlite_web /home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite --host 0.0.0.0 --port 8033  -e /home/sqlite-extensions/text.so -e /home/sqlite-extensions/unicode.so -e /home/sqlite-extensions/uuid.so
```

### [sqlite-viewer](https://github.com/inloop/sqlite-viewer). View SQLite file online.

Upload SQLite database file (from your local machine) annd explore.


### [Web-GUI-for-SQLite](https://github.com/cyrilbois/Web-GUI-for-SQLite)

Upload SQLite database file (from your local machine) annd explore.


### [litecli](https://github.com/dbcli/litecli)
A command-line client for SQLite databases that has auto-completion and syntax highlighting. Useful if you prefer CLI.  

Open Terminal and try with example database:  

```
litecli /home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite
```

Load extensions

```
.load /home/sqlite-extensions/stats
```


## Advanced  

### SQLite Json
Examples

```
CREATE TABLE jsontest   (
  id INTEGER NOT NULL PRIMARY KEY,
  jss JSON
);

INSERT INTO jsontest  VALUES 
(1, json(' { "key1" : "my key 1", "key2": [ "test" ] } ')),
(2, json(' { "key1" : "my new key", "key2": [ "test", "test" ] } ')),
(3, json(' { "key1" : "my yet another key", "key2": [ "test", "test", "test2" ] } '));

SELECT * FROM jsontest;
```

__Links:__
    - [Complete SQlite JSON docs](https://www.sqlite.org/json1.html#jmini)


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
rclone move /home/project/sqlite-db remote:my-s3-bucket/sqlite/
```
__Restore from S3 to local:__
When there is a need to get database from S3 to local folder. 
```
# copy 
rclone copy remote:my-s3-bucket/sqlite/ /home/sqlite-db/
# mount S3 without copying
rclone sync remote:my-s3-bucket/sqlite/ /home/sqlite-db/
```

### tbls

Generate docs for the example database

```
tbls doc sqlite:////home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite /home/static-server/sql-tbls
```

and view SVG files with Static File Server