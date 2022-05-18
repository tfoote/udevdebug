This is the docker file to reproduce the udev issues.

I have pushed the result to Dockerhub as tfoote/udevdebug too if you don't want to wait for the full installation.

Reproduce the issue by running.

apt-get update && apt-get install -s libudev1
