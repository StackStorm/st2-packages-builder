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
docker-compose run el6                               # distro can be one of el6, el7, trusty, wheezy, jessie
```

#### To build st2 packages for a specific branch

```
# Pretty much copied the command from https://github.com/StackStorm/st2-packages/blob/a7a11767343042d12a5b48659f7c8ebb71af8ada/.circle/docker-compose.sh
docker-compose run -e ST2_GITURL=<repo_url> ST2_GITREV=<branch_name> trusty run
```

Packages can be found in `/tmp/st2-packages`. See [this](https://github.com/StackStorm/st2-packages#usage) for more info.

#### Debugging

After build and test stages finished all docker containers remain active, so you are welcome to some more in-depth testing if desired. To do so simply run:

1. List containers
  * sudo docker ps
  * Find the required testing container
  * In our case it will be `st2packages_trustytest_1`

2. To get a shell inside container
 * `sudo docker exec -it st2packages_trustytest_1 bash`

Once done, you are inside the testing environment where all services are up and running. Don't forget to do (after exec):

```
export TERM=xterm
```

At this point you can do any manual testing which is required.
