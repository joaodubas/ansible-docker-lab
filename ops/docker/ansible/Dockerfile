# ansible
#
# VERSION: see `TAG`
FROM joaodubas/ansible-sshd:201405.2
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system dependencies
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        build-essential \
        libyaml-dev \
        python-setuptools \
        python-dev \
        git \
        sshpass \
    && easy_install pip

# install ansible
RUN pip install ansible==1.6.1

# add ansible hosts
ADD hosts /etc/ansible/hosts
ADD load_known_hosts /home/app/.load_known_hosts
RUN echo "source $HOME/.load_known_hosts" >> /home/app/.bashrc \
    touch /home/app/firstrun \
    chown app:app /home/app/.load_known_hosts \
    chown app:app /home/app/firstrun

# run commands
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
