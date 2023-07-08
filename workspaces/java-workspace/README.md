# Java workspace 

Containerized isolated development environment for Java programming language.

## Why this images

1. If you need self-hosted remote development environment.
2. If you want to be one command away from coding in Java.

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/java-workspace
```  

open [localhost:8020](http://localhost:8020) in browser.  

## Features

- Java 
- [Maven](https://maven.apache.org/)
- [Gradle](https://gradle.org/)
- [*Codeserver workspace features*](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/codeserver-workspace)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

## Hello world

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

