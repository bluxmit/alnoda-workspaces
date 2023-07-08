# Rust workspace 

Containerized isolated development environment for Rust programming language.

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/rust-workspace
```  

open [localhost:8020](http://localhost:8020) in browser.  

## Features

- [**Rust programming language**](https://www.rust-lang.org/) 
- [**Cargo**](https://doc.rust-lang.org/cargo/) -s Rust package manager
- [**Rustup**](https://rustup.rs/) - installer for the systems programming language Rust
- [**Openvscode workspace features**](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/openvscode-workspace)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

## Hello world

Check Rust version 

```
rustc --version
```

Create new project folder

```
cargo new my_example
cd my_example
```

The new project is created together, with hello-world app in `src` sub-folder

```
cat src/main.rs
```

Compile it

```
cargo build
```

And then run it

```
./target/debug/my_example
```

We can also compile and then run it, all in one step

```
cargo run
```

## Rustup

[Rustup](https://rustup.rs/) - is a toolchain is a specific version of the collection of programs needed to compile a Rust application. 
It includes, but is not limited to:

- The compiler, rustc
- The dependency manager and build tool, cargo
- The documentation generator, rustdoc

Rustup provides ways to install, remove, update, select and otherwise manage these toolchains and their associated pieces.

Install specific version of Rust toolchain

```
rustup install 1.30.0
```

Show toolchains

```
rustup show
```

Change default toolchain

```
rustup default 1.30.0
```


## Project with dependencies

[Cargo](https://doc.rust-lang.org/cargo/) is Rust package manager. It is a tool that allows Rust packages to declare their 
various dependencies and ensure that you’ll always get a repeatable build.  

Clone example repo 

```
git clone https://github.com/rdesarz/rust-http-server.git
cd rust-http-server
```

Build and start the server 

```
cd example
cargo run --package http-server --bin http-server 0.0.0.0:8026
```

You will see that before cargo builds the package, it installs all the dependencies from the file `Cargo.toml`. 
Then you can open workspace UI "My app on port 8026" and add `/hello.html` to the URL path. 