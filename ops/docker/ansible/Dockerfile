# ansible
#
# VERSION: see `TAG`
FROM joaodubas/ansible-sshd:201405.1
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

# run commands
EXPOSE 22
ENTRYPOINT ["/usr/sbin/sshd"]
CMD ["-D"]
