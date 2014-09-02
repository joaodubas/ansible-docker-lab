# fig
#
# VERSION: see `TAG`
FROM debian:jessie
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system deps
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install curl \
    && curl https://github.com/docker/fig/releases/download/0.5.2/linux \
        > /usr/local/bin/fig \
    && chmod 755 /usr/local/bin/fig \
    && apt-get -y -qq --force-yes purge curl \
    && apt-get -y -qq --force-yes autoremove \
    && apt-get -y -qq --force-yes clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# configure containter
VOLUME ['/app']
ENTRYPOINT ['/usr/local/bin/fig']
CMD ['--version']
