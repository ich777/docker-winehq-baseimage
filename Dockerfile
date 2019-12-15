FROM ubuntu

MAINTAINER ich777

ADD /scripts/ /opt/scripts/

#Server Start
ENTRYPOINT ["/opt/scripts/start-server.sh"]