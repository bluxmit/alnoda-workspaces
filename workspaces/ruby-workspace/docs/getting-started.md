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

## Ruby

Check Ruby version 

```
ruby -v
```

Install Rails - a web application development framework written in the Ruby programming language. 

```
gem install rails
```

Check version 

```
rails --version
```

## Bundler

Create file `Gemfile` with the following content 

```
source 'https://rubygems.org'
gem 'nokogiri'
gem 'rack', '~> 2.0.1'
gem 'rspec'
```

Install all of the required gems 

```
bundle install
```

## Rbenv

Use [rbenv](https://github.com/rbenv/rbenv) to pick a Ruby version for your application and guarantee that your development environment matches production. 

List available versions, and install another one 

```
rbenv install --list
rbenv install 3.0.4
```

Lists all Ruby versions known to rbenv, and shows an asterisk next to the currently active version. 

```
rbenv versions
```

__global environment__  


Change global Ruby (for all folders)

```
rbenv global 3.0.4
```

__local environment (specific folder)__  

Chose local Ruby environment for this specific folder

```
rbenv local 3.0.4
```

## Basic example 

Create file `http_server.rb` 

```rb
# http_server.rb
require 'socket'
server = TCPServer.new 8030
 
while session = server.accept
  request = session.gets
  puts request
 
  session.print "HTTP/1.1 200\r\n" # 1
  session.print "Content-Type: text/html\r\n" # 2
  session.print "\r\n" # 3
  session.print "Hello world! The time is #{Time.now}" #4
 
  session.close
end
```

Serve simple server 

```
ruby http_server.rb
```

Open browser on [localhost:8030](http://localhost:8030/)





