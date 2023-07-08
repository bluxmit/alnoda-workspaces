# Go workspace 

Containerized isolated portable development environment for Go programming language projects.

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/go-workspace
```  

open [localhost:8020](http://localhost:8020) in browser.  

## Features

- [Go](https://go.dev/) 
- [**Code-server**](https://github.com/cdr/code-server) - open source version of popular Visual Studio Code IDE. Codeserver has VS-Code extensions and works in browser. 
- [**Alnoda workspace features**](https://docs.alnoda.org/)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

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
    r.GET("/", func(c *gin.Context) {
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
- `go install` - will compile and move the executable to executable directory included in $PATH, so that you can run this executable from any path on the terminal. 

Run the simple server with 

```
export PORT=8026
go run main.go
```

Open Quickstart page, go to "My apps" and use port 8026 shortcut to open your web app

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
export PORT=8026
simpleserver
```

and the server will start