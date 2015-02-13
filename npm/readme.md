NPM
===

Requirements
------------

Have Node.js and NPM installed

> $ sudo yum install nodejs npm

> $ sudo apt-get install nodejs npm


Packages management
-------------------

### Location

Packages are located in `node_modules` directory by default

You can specify different directory in `install` command, at the end of the list of parameters

### Package.json

Holds the definition of a package, with its dependencies

### Install

> $ npm install package-name [path/to/destination]

If `package.json` is present you can install all dependencies just by

> $ npm install

### Save to package.json

#### As dependency

> $ npm install --save package-name

### As development dependency

> $ npm install --save-dev package-name

### Uninstall

> $ npm uninstall package-name

### Update

> $ npm update [package-name]


Package.json example
--------------------

```json
{
  "name": "package-name",
  "description": "package-description",
  "keywords": [],
  "homepage": "https://package-url",
  "author": {
    "name": "author-name",
    "email": "author-email",
    "url": "http://author-url"
  },
  "dependencies": {},
  "devDependencies": {
    "grunt": "~0.4.5",
    "load-grunt-tasks": "~0.6.0",
    "grunt-phplint": "~0.0.5",
    "grunt-phpunit": "~0.3.5",
    "grunt-phpcs": "~0.2.3",
    "grunt-phpmd": "~0.1.1",
    "grunt-phpcpd": "~0.1.3"
  },
  "repository": {
    "type": "git",
    "url": "git@github.com:package-repository-url"
  }
}
```