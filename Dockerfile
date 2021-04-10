FROM ubuntu:20.04

### Build tools ###
COPY install-packages.sh .
RUN ./install-packages.sh

# libnice build
COPY install-libnice.sh .
RUN ./install-libnice.sh

# srtp build
COPY install-libsrtp.sh .
RUN ./install-libsrtp.sh

# Datachannel build
COPY install-usrsctp.sh .
RUN ./install-usrsctp.sh

COPY install-websockets.sh .
RUN ./install-websockets.sh

# Clone and install janus-gateway
COPY install-janus.sh .
RUN ./install-janus.sh

### Cleaning ###
RUN apt-get clean && apt-get autoclean && apt-get autoremove
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 8188
EXPOSE 8088
EXPOSE 8089
EXPOSE 8889
EXPOSE 8000
EXPOSE 7088
EXPOSE 7089
EXPOSE 10000-10300/udp

ENTRYPOINT ["/opt/janus/bin/janus"]
