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

#### To build st2 packages from master

```
vagrant ssh
git clone git@github.com:StackStorm/st2-packages.git
cd st2-packages
docker-compose run el6
```

#### To build st2 packages for a specific branch

```
# Pretty much copied the command from https://github.com/StackStorm/st2-packages/blob/a7a11767343042d12a5b48659f7c8ebb71af8ada/.circle/docker-compose.sh
docker-compose run -e ST2_GITURL=<repo_url> ST2_GITREV=<branch_name> trusty build
```

#### Interact with packages

```
docker ps                                     # view container list
docker exec st2packages-centos6test_1 bash    # connect to the test container which contains packages
```

Packages can be found in `/tmp/st2-packages`. See [this](https://github.com/StackStorm/st2-packages#usage) for more info.
