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

## Known Issues

* The integration with the GNOME Desktop is not working for now
* If you close the window, the player disapears but it's hard to make it appear again (you have to kill it)
* You can't use the multimedia keys
* You have to start it from the console
