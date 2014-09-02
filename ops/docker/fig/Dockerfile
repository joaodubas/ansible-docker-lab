# fig
#
# VERSION: see `TAG`
FROM debian:jessie
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system deps
ADD https://github.com/docker/fig/releases/download/0.5.2/linux /usr/local/bin/fig
RUN chmod 755 /usr/local/bin/fig

# configure containter
WORKDIR /app
VOLUME ["/app"]
ENTRYPOINT ["/usr/local/bin/fig"]
CMD ["--version"]
