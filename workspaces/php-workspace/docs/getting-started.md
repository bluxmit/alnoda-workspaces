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


## Hello World

Check PHP version

```
php -v
```

Open IDE and create file `hello.php` with the following content

```
<html>
 <head>
  <title>PHP Test</title>
 </head>
 <body>
 <?php echo '<p>Hello World</p>'; ?> 
 </body>
</html>
```

Start server in terminal 

```
cd /home/project
php -S 127.0.0.1:8030
```

Open [localhost:8030/hello.php](http://localhost:8030/hello.php) in browser

## Website example

Clone GitHub repo with a PHP website, for example

```
git clone https://github.com/banago/simple-php-website.git
```

Server with PHP development server

```
cd simple-php-website
php -S 0.0.0.0:8030
```

<p align="center">
  <img src="https://raw.githubusercontent.com/bluxmit/alnoda-workspaces/main/workspaces/php-workspace/img/serve-website.png" alt="serve-website" width="500">
</p> 

# Composer

Install package with Composer

```
composer require phpunit/php-timer
```

