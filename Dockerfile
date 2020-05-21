FROM debian:jessie-slim

ARG username
RUN apt-get update && \
    apt-get install -y banshee && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

## does the whole update install clean cycle again, but avoids me to reinstall the whole gnome desktop environment
## feel free to concat banshee and gnome-themes instead
RUN apt-get update && \
    apt-get install -y gnome-themes && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN useradd ${username}

USER ${username}
CMD ["/usr/bin/banshee"]
