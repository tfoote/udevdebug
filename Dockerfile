FROM ubuntu:jammy

# Disable updates
RUN sed -i 's/.*jammy-updates/######&/' /etc/apt/sources.list

ARG DEBIAN_FRONTEND=noninteractive

# install some things from base ubuntu image
RUN apt-get update && apt-get install -y ubuntu-desktop

RUN apt-get update && apt-get install -y aptdaemon apturl brltty colord dbus-user-session fprintd gdm3 gnome-control-center gnome-initial-setup gnome-remote-desktop   gnome-shell gnome-shell-extension-appindicator gnome-shell-extension-desktop-icons-ng gnome-shell-extension-ubuntu-dock gparted   gstreamer1.0-packagekit language-selector-gnome libnss-systemd libpam-fprintd modemmanager nautilus-share netplan.io network-manager   network-manager-config-connectivity-ubuntu network-manager-gnome network-manager-openvpn network-manager-openvpn-gnome   network-manager-pptp network-manager-pptp-gnome packagekit packagekit-tools pkexec plymouth plymouth-label plymouth-theme-spinner   plymouth-theme-ubuntu-text policykit-1 polkitd python3-aptdaemon python3-aptdaemon.gtk3widgets rtkit snapd   software-properties-common software-properties-gtk systemd-oomd systemd-timesyncd ubiquity ubiquity-frontend-gtk ubuntu-desktop   ubuntu-desktop-minimal ubuntu-minimal ubuntu-release-upgrader-gtk ubuntu-session ubuntu-standard update-manager update-notifier

# Reenable updates
RUN sed -i 's/######//' /etc/apt/sources.list && apt-get update

