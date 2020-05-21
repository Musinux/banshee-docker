install:
	sudo docker build --build-arg username=$(USER) -t banshee .
start:
	rm -rf /tmp/pulseaudio.socket /tmp/pulseaudio.client.conf
	cp ./pulseaudio.client.conf /tmp/pulseaudio.client.conf
	pactl load-module module-native-protocol-unix socket=/tmp/pulseaudio.socket
	docker run \
		--net=host \
		--volume=$(HOME):$(HOME):rw \
		--volume="$(HOME)/.Xauthority:$(HOME)/.Xauthority:rw" \
		-v /tmp/.X11-unix:/tmp/.X11-unix \
		-e DISPLAY=unix$(DISPLAY) \
		--env DBUS_SESSION_BUS_ADDRESS="$(DBUS_SESSION_BUS_ADDRESS)" \
		-v /run/user/$$(id -u)/bus:/run/user/$$(id -u)/bus:rw \
		-v /var/lib/dbus/machine-id:/var/lib/dbus/machine-id \
		--device /dev/snd \
		-v /var/run/dbus/:/var/run/dbus \
		--env PULSE_SERVER=unix:/tmp/pulseaudio.socket \
    --env PULSE_COOKIE=/tmp/pulseaudio.cookie \
    --volume /tmp/pulseaudio.socket:/tmp/pulseaudio.socket \
    --volume /tmp/pulseaudio.client.conf:/etc/pulse/client.conf \
		-ti banshee /bin/bash
		
