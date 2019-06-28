FROM ubuntu:bionic

MAINTAINER vasilis.ventirozos@credativ.us

ENV PGUSER=postgres
ENV PGBINDIR=/home/$PGUSER/pgsql
ENV PGDATADIR=/home/$PGUSER/pgdata


RUN apt-get update && \
apt-get install -y \
	sudo wget apt-transport-https vim less build-essential \
	libreadline-dev zlib1g-dev flex bison libxml2-dev mc python3.6 python3-pip\
	libxslt-dev libssl-dev screen git unzip cpanminus && \
	useradd -c /home/$PGUSER -ms /bin/bash $PGUSER


run echo "$PGUSER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers


USER $PGUSER
WORKDIR /home/$PGUSER
CMD sudo tail -f /var/log/syslog
#Tadah !
