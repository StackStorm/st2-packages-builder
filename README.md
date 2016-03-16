## Purpose

A vagrant box with tools that will help build StackStorm packages

### What packages?
Specifically `st2` and `st2mistral` as build by [StackStorm/st2-packages](https://github.com/StackStorm/st2-packages).

### How does this work?

#### To provision

```
git clone git@github.com:manasdk/st2-package-builder.git
cd st2-packages-builder
vagrant up
```

#### To build packages

```
vagrant ssh
git clone git@github.com:StackStorm/st2-packages.git
cd st2-packages
docker-compose run el6
```

#### To interact with packages

```
docker ps                                     # view container list
docker exec st2packages-centos6test_1 bash    # connect to the test container which contains packages
```

Packages can be found in `/tmp/st2-packages`. See [this](https://github.com/StackStorm/st2-packages#usage) for more info.
