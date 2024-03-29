# Install Banshee Music Player on Docker

The great Banshee Music Player for linux has not been updated since 2016. However, it's a really great music player for linux.

Because of deprecation of its mono dependencies and gstreamer, it's not working anymore on latest (may 2020) debian.

I found a workaround by using docker to install it on debian jessie.

Disclaimer: it's an heavy install for such a small software, so keep that in mind.

For now, I made it work on a debian 10.4 host.

## Download
```
git clone https://github.com/musinux/banshee-docker
```

## Install
**You need to install docker first**
```bash
sudo apt install gconf-service # gnome now uses dconf but banshee needs dconf to configure the music folder
cd banshee-docker
make install # may take a while
```

## Run
Consider reading the Makefile to understand what is done under the hood.
It will share all your current user folder with the banshee container
Any security issue related to banshee may affect your system too, because the isolation is weakened to make the integration with the desktop work.

```bash
cd banshee-docker
make start
```

## Alternate solution with x11docker

[x11docker](https://github.com/mviereck/x11docker) is a tool to assist in running dockerized GUI apps. Depending on your host environment, you may find x11docker provides you with some extra flexibility to get the application running.

The x11docker sub-directory in this repository contains a simple Dockerfile and shell script to get started. **You will likely have to adjust the x11docker options to fit your environment.**

With x11docker installed, the following will build the banshee image and run x11docker with some basic settings to get you started (host pulseaudio, host dbus, mounting $HOME, network access)

```bash
cd x11docker
./run.sh
```
