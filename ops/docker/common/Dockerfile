# ansible-common
#
# VERSION: see `TAG`
FROM debian:jessie
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# add system deps
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        locales \
        openssl
        
# ensure utf-8
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen
ENV LANG en_US.utf8
ENV LC_ALL en_US.utf8

# set root password
ENV UPASS 123root4
RUN echo root:$UPASS | chpasswd

# add unprivileged user
ONBUILD ENV APPPASS 123app4
ONBUILD RUN useradd \
        -d /home/app \
        -m \
        -p $(openssl passwd $APPPASS) \
        -s /bin/bash \
        app
