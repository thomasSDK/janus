#!/bin/bash

cd /root && git clone https://github.com/meetecho/janus-gateway.git

cd /root/janus-gateway && \
	./autogen.sh && \
	./configure --prefix=/opt/janus \
	--disable-docs \
	--disable-rabbitmq \
	--disable-mqtt \
	--disable-nanomsg && \
	make && \
	make install && \
	make configs