#!/bin/bash
docker build -t banshee .

x11docker \
  --name=banshee \
  --home=$HOME \
  --pulseaudio=host \
  --hostdbus \
  --share /run/dbus/system_bus_socket \
  --network \
  --share /run/udev/data:ro \
  -- \
  --cap-add ALL \
  --security-opt seccomp=unconfined \
  --security-opt apparmor=unconfined \
  --privileged \
  -- \
  banshee
