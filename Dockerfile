FROM ubuntu:jammy

# Disable updates
RUN sed -i 's/.*jammy-updates/######&/' /etc/apt/sources.list

ARG DEBIAN_FRONTEND=noninteractive

# install some things from base ubuntu image

RUN apt-get update && apt-get install -y udev
RUN apt-get update && apt-get install -y init


# Reenable updates
RUN sed -i 's/######//' /etc/apt/sources.list && apt-get update

ENTRYPOINT apt-get install libudev1
