# Ruby workspace 

Containerized portable isolated development environment for Ruby projects.

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/ruby-workspace
```  

and open [localhost:8020](http://localhost:8020) in browser.  

## Features

- [Ruby](https://www.ruby-lang.org/) 
- [Rbennv](https://github.com/rbenv/rbenv)
- [Bundler](https://bundler.io/)
- [**Openvscode workspace features**](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/openvscode-workspace)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

## Ruby

Open terminal, and check Ruby version 

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

## Hello world

Open VS-code, and create file `http_server.rb` 

```rb
# http_server.rb
require 'socket'
server = TCPServer.new 8026
 
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

Now open terminal, and execute to serve simple server 

```
ruby http_server.rb
```

In workspace UI go to "My apps" and use port 8026 shortcut to open your web app


## Bundler

[Bundler](https://bundler.io/) provides a consistent environment for Ruby projects by tracking and installing 
the exact gems and versions that are needed. 

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

Use [rbenv](https://github.com/rbenv/rbenv) to pick a Ruby version for your application and guarantee 
that your development environment matches production. 

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

