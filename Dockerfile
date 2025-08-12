FROM ich777/debian-baseimage

LABEL org.opencontainers.image.authors="admin@minenet.at"
LABEL org.opencontainers.image.source="https://github.com/ich777/docker-winehq-baseimage"

RUN dpkg --add-architecture i386 && \
	apt-get update && \
	apt -y install gnupg2 && \
	wget -qO /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
	echo "deb [signed-by=/etc/apt/keyrings/winehq-archive.key] https://dl.winehq.org/wine-builds/debian/ trixie main" | tee /etc/apt/sources.list.d/wine.list && \
	apt-get update && \
	apt -y install --no-install-recommends winehq-stable && \
	apt-get -y --purge remove gnupg2 && \
	apt-get -y autoremove && \
	rm -rf /var/lib/apt/lists/*