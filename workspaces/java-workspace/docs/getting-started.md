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


## Example

```
java -version
```

Open IDE and create file `Main.java` with the following content

```
public class Main {
  public static void main(String[] args) {
    System.out.println("Hello World");
  }
}
```

Use terminal to compile and execute

```
cd /home/project
javac Main.java
java Main
```

## Maven

Maven helps with:

- Making the build process easy
- Providing a uniform build system
- Providing quality project information
- Encouraging better development practices

Check Maven version in terminal

```
mvn -v
```

Build Java code

```
cp -r /home/abc/example /home/project/example 
cd /home/project/example
mvn compile
```

This will run Maven, telling it to execute the compile goal. When it’s finished, you should find the compiled .class files in the target/classes directory.   

Run the package goal

```
mvn package
```

To execute the JAR file run

```
java -jar target/gs-maven-0.1.0.jar
```

*(taken from https://spring.io/guides/gs/maven/)*  

# Gradle

Copy example project

```
cp -r /home/abc/example /home/project/example 
cd /home/project/example
```

Check Gradle installation, run Gradle from the command-line

```
cd /home/project/example
gradle
```

Initialize Gradle

```
gradle init
```

Now that Gradle is installed, see what it can do

```
gradle tasks
```

Build project with Gradle

```
gradle build
```



