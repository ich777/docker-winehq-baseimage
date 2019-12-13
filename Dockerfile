FROM ubuntu

MAINTAINER ich777

RUN apt-get update
RUN apt-get -y install wget
RUN apt-get wget -q - https://dl.winehq.org/wine-builds/winehq.key | apt-key add
RUN apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ bionic main'
RUN apt-get update
RUN apt-get -y install --install-recommends winehq-stable