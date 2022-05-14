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

A toolchain is a specific version of the collection of programs needed to compile a Rust application. It includes, but is not limited to:
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

Cargo is also the Rust package manager. It is a tool that allows Rust packages to declare their various dependencies and ensure that you’ll always get a repeatable build.  

Clone example repo 

```
git clone https://github.com/rdesarz/rust-http-server.git
cd rust-http-server
```

Build and start the server 

```
cd example
cargo run --package http-server --bin http-server 0.0.0.0:8030
```

You will see that before cargo builds the package, it installs all the dependencies from the file `Cargo.toml`.  

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/rust-workspace/img/cargo-deps.png" alt="cargo dependencies" width="500">
</p>

Open in your browser [0.0.0.0:8030/hello.html](http://0.0.0.0:8030/hello.html) to see a simple page.
