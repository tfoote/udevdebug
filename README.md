This is the docker file to reproduce the udev issues.

Reproduce the issue by running.


```
docker build . -t udevtest && docker run -it --rm udevtest apt-get install -s libudev1
Sending build context to Docker daemon  72.19kB
Step 1/5 : FROM ubuntu:jammy
 ---> d2e4e1f51132
Step 2/5 : RUN sed -i 's/.*jammy-updates/######&/' /etc/apt/sources.list
 ---> Using cache
 ---> eac0952511fd
Step 3/5 : ARG DEBIAN_FRONTEND=noninteractive
 ---> Using cache
 ---> 1ca6eb41385b
Step 4/5 : RUN apt-get update && apt-get install -y ubuntu-minimal
 ---> Using cache
 ---> 9111be601c87
Step 5/5 : RUN sed -i 's/######//' /etc/apt/sources.list && apt-get update
 ---> Using cache
 ---> 191973d3ea7c
Successfully built 191973d3ea7c
Successfully tagged udevtest:latest
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libnetplan0 python3-netifaces
Use 'apt autoremove' to remove them.
The following additional packages will be installed:
  cron
Suggested packages:
  anacron checksecurity default-mta | mail-transport-agent
The following packages will be REMOVED:
  libnss-systemd libpam-systemd netplan.io systemd-timesyncd ubuntu-minimal udev
The following NEW packages will be installed:
  cron
The following packages will be upgraded:
  libudev1
1 upgraded, 1 newly installed, 6 to remove and 6 not upgraded.
Remv libnss-systemd [249.11-0ubuntu3]
Remv libpam-systemd [249.11-0ubuntu3]
Remv ubuntu-minimal [1.481]
Remv netplan.io [0.104-0ubuntu2]
Remv systemd-timesyncd [249.11-0ubuntu3]
Remv udev [249.11-0ubuntu3]
Inst cron (3.0pl1-137ubuntu3 Ubuntu:22.04/jammy [amd64])
Inst libudev1 [249.11-0ubuntu3] (249.11-0ubuntu3.1 Ubuntu:22.04/jammy-updates [amd64])
Conf libudev1 (249.11-0ubuntu3.1 Ubuntu:22.04/jammy-updates [amd64])
Conf cron (3.0pl1-137ubuntu3 Ubuntu:22.04/jammy [amd64])
```


## Published image

I have pushed the result to Dockerhub as tfoote/udevdebug too if you don't want to wait for the full installation.

`docker run -ti --rm tfoote/udevdebug:2 apt-get install -s libudev1`
