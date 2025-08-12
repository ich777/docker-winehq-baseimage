FROM ich777/debian-baseimage

LABEL org.opencontainers.image.authors="admin@minenet.at"
LABEL org.opencontainers.image.source="https://github.com/ich777/docker-winehq-baseimage"

RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt -y install gnupg2 software-properties-common && \
	wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add - && \
	echo " deb https://dl.winehq.org/wine-builds/debian/ trixie main" >> /etc/apt/sources.list.d/wine.list && \
	apt-get update && \
	apt -y install --no-install-recommends winehq-stable && \
	apt-get -y --purge remove software-properties-common gnupg2 && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*