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

## Example: hello world

Check Go version 

```
go version
```

Create new Go project

```
mkdir myProject/
cd myProject
go mod init myProject
```

Create file `main.go`

```
package main
import "fmt"
func main() {
  fmt.Println("Hello Go")
}
```

Then test it using the go run command 

```
go run main.go 
```

## Dependencies

Go Modules - Go’s dependency management system that makes dependency version information explicit and easier to manage.  

Create new Go project

```
mkdir simpleserver/
cd simpleserver
go mod init simpleserver
```

Adding a remote module as a dependency manually:

```
go get github.com/spf13/cobra@latest
```

Check `go.mod` file 

```
cat go.mod
```

Create file `main.go`  

```
package main
import "github.com/gin-gonic/gin"

func main() {
    r := gin.Default()
    r.GET("/ping", func(c *gin.Context) {
        c.JSON(200, gin.H{
                "message": "pong",
        })
    })
    r.Run() 
}
```

To add module requirements and sums execute

```
go mod tidy
```

## Run, build and install

- `go run` - to quickly test your go code and to check the output. But internally it compiles your code and builds an executable binary in a temporary location, launches that temp exe-file and finally cleans it when your app exits.
- `go build` - compile and builds executable in current directory.
- `go build` - will compile and move the executable to executable directory included in $PATH, so that you can run this executable from any path on the terminal. 

Run the simple server with 

```
export PORT=8030
go run main.go
```

Open in browser [localhost:8030/ping](http://localhost:8030/ping)

Build executable locally 

```
go build
```

This will create an executable `simpleserver` in the same folder.   

Build and move to executable folder 

```
go install
```

Now you can execute anywhere in terminal 

```
export PORT=8030
simpleserver
```

and the server will start