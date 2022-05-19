This is the docker file to reproduce the udev issues.

Reproduce the issue by running.


```
docker build . -t udevtest && docker run -it --rm udevtest apt-get install -s libudev1
Sending build context to Docker daemon  83.46kB
Step 1/6 : FROM ubuntu:jammy
 ---> d2e4e1f51132
Step 2/6 : RUN sed -i 's/.*jammy-updates/######&/' /etc/apt/sources.list
 ---> Using cache
 ---> eac0952511fd
Step 3/6 : ARG DEBIAN_FRONTEND=noninteractive
 ---> Using cache
 ---> 1ca6eb41385b
Step 4/6 : RUN apt-get update && apt-get install -y udev
 ---> Using cache
 ---> a34e4eb0adb7
Step 5/6 : RUN apt-get update && apt-get install -y init
 ---> Using cache
 ---> 9e832e729e43
Step 6/6 : RUN sed -i 's/######//' /etc/apt/sources.list && apt-get update
 ---> Using cache
 ---> f634b7e575ec
Successfully built f634b7e575ec
Successfully tagged udevtest:latest
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following packages will be REMOVED:
  libnss-systemd libpam-systemd systemd-timesyncd udev
The following packages will be upgraded:
  libudev1
1 upgraded, 0 newly installed, 4 to remove and 5 not upgraded.
Remv libnss-systemd [249.11-0ubuntu3]
Remv libpam-systemd [249.11-0ubuntu3]
Remv systemd-timesyncd [249.11-0ubuntu3]
Remv udev [249.11-0ubuntu3]
Inst libudev1 [249.11-0ubuntu3] (249.11-0ubuntu3.1 Ubuntu:22.04/jammy-updates [amd64])
Conf libudev1 (249.11-0ubuntu3.1 Ubuntu:22.04/jammy-updates [amd64])

```


## Published image

I have pushed the result to Dockerhub as tfoote/udevdebug too if you don't want to wait for the full installation.

`docker run -ti --rm tfoote/udevdebug:3 apt-get install -s libudev1`
