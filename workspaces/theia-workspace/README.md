# Theia workspace

General-purpose containerized isolated development environment with Theia IDE.

## Why this images

1. If you need isolated dev environment where you can code and install packages and apps without affecting the base operating system.
2. If you are building self-hosted remote development environment.

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/theia-workspace
```  

and open [localhost:8020](http://localhost:8020) in browser.  

## Features

- [**Eclipse Theia**](https://theia-ide.org/docs/) - open source version of popular Visual Studio Code IDE
- [**Alnoda workspace**](https://docs.alnoda.org/)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  