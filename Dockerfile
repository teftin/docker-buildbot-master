FROM debian:wheezy
MAINTAINER Stan <teftin@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y python-virtualenv python-dev libsqlite3-dev gcc libmysqlclient-dev

RUN virtualenv /bbot-ve
RUN /bbot-ve/bin/pip install pysqlite sqlalchemy==0.7.10 sqlalchemy-migrate==0.7.1 buildbot==0.8.9 mysql-python

ADD run.sh /run.sh

VOLUME /bbot

EXPOSE 8010
CMD exec bash /run.sh
