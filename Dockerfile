FROM ubuntu

MAINTAINER ich777

RUN dpkg --add-architecture i386
RUN apt-get update
RUN apt-get -y install wget software-properties-common
RUN wget -qO - https://dl.winehq.org/wine-builds/winehq.key | apt-key add -
RUN apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DFA175A75104960E
RUN apt-add-repository 'deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/ ./'
RUN apt-get update
RUN apt-get -y install --install-recommends winehq-staging
RUN add-apt-repository --remove 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
RUN add-apt-repository --remove 'deb https://download.opensuse.org/repositories/Emulators:/Wine:/Debian/xUbuntu_18.04/ ./'
RUN apt-get -y --purge remove wget software-properties-common
RUN apt-get -y autoremove