# Get started

This doc has examples how to use workspace toolset to develop and fill SQLite databases.  
  
Open Quickstart page [http://localhost:800/](http://localhost:8020/) for quick access to all the tools 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/sqlite-wid.png" alt="SQLITE WID" width="750">
</p> 

Use workspace terminal [http://localhost:8026/](http://localhost:8026/) for CLI commands.  

Workspace conntains example SQLite database, the file `/home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite`  


## NocoDB

[NocoDB](https://docs.nocodb.com/). NocoDB is an open source Airtable alternative. Use it to create SQLite tables, develop databases 
without SQL.  

NocoDB can also be used to fill SQLite databases with data with the help of nice interactive UI. 

Launch the workspace, navigate to the Workspace UI and open NocoDB. Or open [localhost:8030](http://localhost:8030/) directly in browser. 
Create new user (provide any email,pass). Create tables, enter data, import data files, create forms and much more.  

### NocoDB with existing SQLite database

Create NocoDB project with an empty external SQLite database file `/home/project/sqlite-db/db-main.sqlite`. 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/noco-new-main.png" alt="Noco new main" width="750">
</p> 

Create some data, and explore it with Sqlite-web [localhost:8032](http://localhost:8032/)

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/sqliteweb-main.gif" alt="Sqliteweb main" width="750">
</p> 

You can also open existing SQLIte database, and edit it with NocoDB. Let's open example SQLite database `/home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite` 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/noco-chinook.gif" alt="noco chinook" width="750">
</p> 


### query NocoDB data 

NocoDB is backed by SQLite3, database file `/home/nocodb/noco.db `.  

You can query NocoDB databse directly with sqlite-web. Open it through the Workspace UI, or navigate to [localhost:8031](http://localhost:8031/) directly.  

At any moment you can copy SQLite database from NocoDB with all the data, edit, modify and configure for the needs of your application. 
- Copy of NocoDB database and continue developing with Sqlite-web
```
mv -f /home/nocodb/noco.db /home/project/sqlite-db/db-main.sqlite 
```
Open Sqlite-web on [localhost:8032](http://localhost:8032/)


## Sqlite 

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

### Upload & download SQLite databases

No matter if workspace is used locally, in cloud or kubernetes you can upload and download database files using file browser 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/filebrowser-download.png" alt="Filebrowser" width="500">
</p> 

### Copy SQlite databases

SQlite is just a file, jou can copy it and replace other databases. For example, if you want to copy NocoDB database 
into the "Main" database, which is served by Sqlite-web on [localhost:8032](http://localhost:8032/) simply execute in terminal

```
mv -f /home/nocodb/noco.db /home/project/sqlite-db/db-main.sqlite 
```

You also can use file browser to move or copy files.


## [sqlite-web](https://github.com/coleifer/sqlite-web)

Serve any SQLite database. There are 2 SQlite database served by default:

- NocoDB database. Sqlite-web is served on [localhost:8031](http://localhost:8031/)
- "Main" database. Empty SQlite3 database. Sqlite-web is served on [localhost:8032](http://localhost:8032/)
- "Example/test" database. Filled with test "Chinook" database. Sqlite-web is served on [localhost:8033](http://localhost:8033/)

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/sqliteweb-chinook.gif" alt="sqliteweb chinook" width="750">
</p> 


### Serve on-demand SQlite database

One port 8034 is reserved for serving on-demand database with Sqlite-web. 
Serve it with the following command

```
sqlite_web <path-to-your-sqlite-database-file> --host 0.0.0.0 --port 8034
```

Example, start sqlite-web on port 8034 for SQLite database file `/home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite`

```
sqlite_web /home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite --host 0.0.0.0 --port 8034 
```

and with extensions loaded:

```
sqlite_web /home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite --host 0.0.0.0 --port 8034  -e /home/sqlite-extensions/text.so -e /home/sqlite-extensions/unicode.so -e /home/sqlite-extensions/uuid.so
```

## [sqlite-viewer](https://github.com/inloop/sqlite-viewer). 

Explore and query SQLite databases. Upload SQLite database file (from your local machine) and explore.

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/sqlite-viewer.png" alt="sqlite viewer" width="500">
</p> 


## [Web-GUI-for-SQLite](https://github.com/cyrilbois/Web-GUI-for-SQLite)

Explore and query SQLite databases. Upload SQLite database file (from your local machine) and explore.

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/sqlite-web-gui.png" alt="sqlite web gui" width="500">
</p> 


## [litecli](https://github.com/dbcli/litecli)

A command-line client for SQLite databases that has auto-completion and syntax highlighting. Useful if you prefer CLI.  

Open Terminal and try with example database:  

```
litecli /home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/litecli-1.png" alt="litecli" width="500">
</p> 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/litecli-2.png" alt="litecli pager" width="500">
</p> 


Load extensions

```
.load /home/sqlite-extensions/stats
```

### Tbls

Generate docs for the example database

```
tbls doc sqlite:////home/static-server/sqlite-viewer/examples/Chinook_Sqlite.sqlite /home/static-server/sql-tbls
```

and view SVG files with Static File Server

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/tbls.gif" alt="tbls" width="750">
</p> 


### DB designer

With DB designer you can visually create ERD diagrams, and generate DDL SQL scripts 

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/sqlite-workspace/img/dbdesigner.png" alt="db designer" width="500">
</p> 


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


### Rclone

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

