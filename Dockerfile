FROM ich777/debian-baseimage

LABEL maintainer="admin@minenet.at"

RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt-get -y install wget gnupg software-properties-common && \
	apt-get -y install --reinstall ca-certificates && \
	wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
	apt-add-repository https://dl.winehq.org/wine-builds/debian/ && \
	apt-get update && \
	apt-get -y install --install-recommends winehq-stable && \
	add-apt-repository --remove 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main' && \
	apt-get -y --purge remove software-properties-common gnupg && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*