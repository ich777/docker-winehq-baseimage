FROM ubuntu

MAINTAINER ich777

ADD /scripts/ /opt/scripts/

RUN chmod -R 770 /opt/scripts/

#Server Start
ENTRYPOINT ["/opt/scripts/start-server.sh"]