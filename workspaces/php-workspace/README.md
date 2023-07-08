# PHP workspace 

Containerized isolated development environment for PHP programming language.  
Includes PHP, Composer, code editor, terminal, filebrowser and git manager. 

## Start
 
```
docker run --name space-1 -d -p 8020-8040:8020-8040 --restart=always alnoda/php-workspace
```  

open [localhost:8020](http://localhost:8020) in browser.  

## Features

- **PHP** programming language
- [**PHPBrew**](https://github.com/phpbrew/phpbrew) - phpbrew builds and installs multiple version php(s) in your $HOME directory.
- [**Composer**](https://getcomposer.org/)
- [**Theia workspace features**](https://github.com/bluxmit/alnoda-workspaces/tree/main/workspaces/theia-workspace)

## Links

[__Alnoda docs__](https://docs.alnoda.org/)    
[__Alnoda Hub__](https://alnoda.org)  

## PHP Hello World

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
php -S 127.0.0.1:8026
```

Open Quickstart page, go to "My apps" and use port 8026 shortcut to open your web app


## Website example

Clone GitHub repo with a PHP website, for example

```
git clone https://github.com/banago/simple-php-website.git
```

Server with PHP development server

```
cd simple-php-website
php -S 0.0.0.0:8026
```

Open Quickstart page, go to "My apps" and use port 8026 shortcut to open your web app

## Composer

Install package with Composer

```
composer require phpunit/php-timer
```

## [PHPBrew](https://github.com/phpbrew/phpbrew)

To list known versions:

```
phpbrew known
```

Simply build and install PHP with default variant:

```
phpbrew install 5.4.0 +default
```

Use (switch version temporarily):

```
phpbrew use 5.4.22
```

Switch PHP version (switch default version)

```
phpbrew switch 5.4.18
```