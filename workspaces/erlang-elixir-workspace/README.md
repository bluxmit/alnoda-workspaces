# Erlang-elixir workspace 

Containerized isolated development environment for Erlang and Elixir programming languages. 

## Why this images

1. If you need self-hosted remote development environment.
2. If you want to be one command away from coding in Erlang, Elixir.

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/erlang-elixir-workspace
```  

and open [localhost:8020](http://localhost:8020) in browser.  

## Features

- [Erlang/OTP](https://www.erlang.org/)
- [Elixir](http://elixir-lang.org/)
- [Kerl](https://github.com/kerl/kerl) - easy building and installing of Erlang/OTP instances.
- [Kiex](https://github.com/taylor/kiex) - allows you to easily build and switch between different Elixir versions.
- [**Java workspace features**](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/java-workspace)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

## Erlang 

### Erlang shell 

Erlang shell is used for testing of expressions. Start the Erlang shell from a command prompt with the command `erl`   

having started shell, evaluate the following expressions 

```
2 + 5.
(42 + 77) * 66 / 3.

Str = "abcd".
L = length(Str).
```

### Hello world

Go to the Quickstart page, open VS-Code and create file `hello.erl` with the following code 

```
-module(hello).
-export([hello_world/0]).

hello_world() ->
  io:format("Hello, World!~n", []).
```

Now open Terminal, start Erlang shell with `erl` and execute 

```
c(hello).
```

## Elixir

### Elixir shell 

`iex` is a command which stands for Interactive Elixir. 

Openn terminal, start interactive Elixir shell with `iex` and evaluate

```
40 + 8
"hello" <> " world"
```

### Scripts 

Open IDE and create file `hello.exs` with the following code 

```
IO.puts("Hello world from Elixir")
```

In terminal execute 

```
elixir hello.exs
```

### Manage Elixir versions with Kiex 

List installed versions

```
kiex list
```

List known releases

```
kiex list releases
```

Install a known release

```
kiex install 1.13.0
```

Use specific elixir version

```
kiex use 1.13.0
```