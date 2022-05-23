# Getting started

## Intro  

To start, open Quickstart page [localhost:8020](http://localhost:8020/) for quick access to all the tools
    
From the quicklaunch page you can open workspace tools, such as code editor or terminal 

<div align="center" style="font-style: italic;">
    Demo: Workspace UI 
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/ide-workspace/img/wid-ui.png" alt="wid-ui.png" width="750">
</p>

The main code editor of this workspace is [Code-server](https://github.com/cdr/code-server)

<div align="center" style="font-style: italic;">
    Demo: Code-server
</div>

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/codeserver-workspace/img/codeserver-demo.gif" alt="Code-server demo" width="900">
</p>

Workspace has full-size browser-base terminal

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/base-workspace/img/base-workspace-terminal.gif" alt="Base-Workspace terminal" width="750">
</p> 


## Scala

To check scala version, execute in terminal

```
scala -version
```

To open scala REPL simply execute

```
scala
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/scala-workspace/img/scala-repl.png" alt="scala-repl.png" width="500">
</p>

### Hello world

Use Code editor to create folder `helloworld` with file `Hello.scala` in it. The file should have the following content 

```
object Hello {
    def main(args: Array[String]) = {
        println("Hello, world")
    }
}
```

Open terminal, go into this folder and execute 

```
scala Hello.scala 
```

### Hello world with sbt

cd to the projects directory, and create new project with Sbt 

```
cd /home/project
sbt new scala/scala3.g8
```

Upon prompt type any project name, i.e. "hello-world". Sbt will generate progje boilerplate with the required folder structure.  

Enter the project folder, compile and run the app

```
sbt run 
```


## Coursier

[Coursier](https://get-coursier.io/) is the Scala application and artifact manager. It can install Scala applications and setup your Scala development environment. 
It can also download and cache artifacts from the web.  

Coursier provides a number of services:
- manage the installed Scala applications: `install`, `list`, `update`, `uninstall`, `search`
- configure channels to install Scala applications from: `channel`
- launchers for Scala applications: `launch`, `bootstrap`
- manage the installed JVMs: `java`, `java-home`
- directly manipulate Maven dependencies: `fetch`, `resolve`
- perform setup again

List all applications, installed by Coursier

```
cs list
```

The `install` command installs Scala applications, i.e. 

```
cs install scalafmt
```

If you want to launch another scala version 

```
cs launch scala:2.12.15
```
