# SH-Runner | an easy bash runner

Created for an easy raspberry-pi management, it can be used on any debian/unix (local) system, enjoy!

__Version:__ 0.1 (unstable|incomplete) \
__OS:__ Debian/Unix \
__Require:__ nginx,nodejs \

## Info
---
SH-Runner enable an easy way to run custom bash scripts into unix systems. \
Run bash scripts "as an API" over http protocol with Nginx and integrated Node.js server. 
SH-Runner also include an Angular UI able to create and run custom bash scripts from browser.

## Parts
---
SH-Runner is composed by two parts, sh-runner-app (frontend) and sh-runner-server (backend). \


### sh-runner-app
__sh-runner-app__ is an angular _frontend UI_ managing users input/output. \

### sh-runner-server
__sh-runner-server__ is an nodejs/express _backend server_ performing local script execution and system tasks \



## Quick Setup vs Manual Setup
---
If you want to __[Quick Setup]__ SH-Runner into you system, use script below and install all dependencies and files.
Also, you can follow __[Manual Setup]__ steps and integrate SH-Runner into existing system.

### Quick Setup
---
Open you terminal and follow this setup steps:

```
    $ curl https://raw.githubusercontent.com/carrara88/sh-runner/setup-sh-runner.sh -o setup-sh-runner.sh
    $ sudo chmod 755 setup-sh-runner.sh
    $ ./setup-sh-runner.sh
```

#### Hello Word!
All it's almost done! 👍 Just visit `http://[system-ip]/runner` and follow the wizard!


### Manual Setup
---
If you want to setup SH-Runner manually, follow the steps below.

#### 1) Setup Nginx (skip if nginx is already installed)
[...] missing doc. (see step on `setup-sh-runner.sh`)

#### 2) Setup Node.js (skip if node is already installed)
[...] missing doc. (see step on `setup-sh-runner.sh`)

#### 3) Clone Repository
[...] missing doc. (see step on `setup-sh-runner.sh`)

#### 4) Move APP-Element into /var/www/html
[...] missing doc. (see step on `setup-sh-runner.sh`)

#### 5) Run SERVER-Element
[...] missing doc. (see step on `setup-sh-runner.sh`)

#### 6) Hello Word!
All it's almost done! 👍 Just visit `http://[system-ip]/runner` and follow the wizard!
