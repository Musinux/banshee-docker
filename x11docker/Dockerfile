FROM debian:jessie-slim

RUN apt-get update && \
    apt-get install -y banshee && \
    apt-get clean && \
    apt-get autoremove && \
    rm -rf /var/lib/apt/lists/*

CMD ["/usr/bin/banshee"]
