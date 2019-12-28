FROM debian:buster-slim

LABEL maintainer="admin@minenet.at"

RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get -y install wget gnupg software-properties-common locales && \
	touch /etc/locale.gen && \
	echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
	locale-gen && \
	apt-get -y install --reinstall ca-certificates && \
	wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
	apt-add-repository https://dl.winehq.org/wine-builds/debian/ && \
	apt-get update && \
	apt-get -y install --install-recommends winehq-stable && \
	add-apt-repository --remove 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' && \
	apt-get -y --purge remove software-properties-common gnupg && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8