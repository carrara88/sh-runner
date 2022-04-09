# SH-Runner | an easy bash runner

__Info:__ SH-Runner enable an easy way to run custom bash scripts into unix systems. \
__Version:__ 0.1 (dev in progress...) \
__OS:__ Debian/Unix \
__Require:__ nginx,nodejs

## Elements
SH-Runner is composed by two elements: APP (frontend) and SERVER (backend). \
__APP-Element__ is an angular _frontend UI_ managing users input/output. \
__SERVER-Element__ is an nodejs/express _backend server_ performing local script execution and system tasks \

### APP-Element
[...] missing doc.

### SERVER-Element
[...] missing doc.

---

## Quick Setup vs Manual Setup

If you want to __[Quick Setup]__ SH-Runner into you system, use script below and install all dependencies and files.
Also, you can follow __[Manual Setup]__ steps and integrate SH-Runner into your existing system.

### Quick Setup

Open you terminal and follow this setup steps:

```
    $ curl https://raw.githubusercontent.com/carrara88/sh-runner/setup-sh-runner.sh -o setup-sh-runner.sh
    $ sudo chmod 755 setup-sh-runner.sh
    $ ./setup-sh-runner.sh
```

#### Hello Word!
All it's almost done! 👍 Just visit `http://[your-ip]/runner` and follow the wizard!


### Manual Setup

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
All it's almost done! 👍 Just visit `http://[your-ip]/runner` and follow the wizard!
