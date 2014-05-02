# sshd
#
# VERSION: see `TAG`
FROM joaodubas/ansible-common:201405.1
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# add system deps
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        openssh-server

# prepare unprivileged user to ssh
RUN mkdir /home/app/.ssh \
    && chmod 700 /home/app/.ssh \
    && chown app:app /home/app/.ssh

# allow ssh access to a especific group
# remove pam_loginuid.so to allow login for unprivileged user
# see: http://stackoverflow.com/questions/22547939/
ENV SSH_GROUP sshusers
RUN mkdir /var/run/sshd \
    && groupadd $SSH_GROUP \
    && usermod -a -G $SSH_GROUP app \
    && echo AllowGroups $SSH_GROUP >> /etc/ssh/sshd_config \
    && sed -ri 's/^([a-z ]+)(pam_loginuid.so)/#\1\2/g' /etc/pam.d/sshd

# run commands
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
