FROM debian:jessie-slim

ARG username
RUN apt-get update && \
    apt-get install -y banshee && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

RUN useradd ${username}

USER ${username}
CMD ["/usr/bin/banshee"]
