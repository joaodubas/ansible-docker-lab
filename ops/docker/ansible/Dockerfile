# ansible
#
# VERSION: see `TAG`
FROM joaodubas/ansible-common:201405.1
MAINTAINER Joao Paulo Dubas "joao.dubas@gmail.com"

# install system dependencies
RUN apt-get -y -qq --force-yes update \
    && apt-get -y -qq --force-yes install \
        build-essential \
        libyaml-dev \
        python-setuptools \
        python-dev \
        git \
    && easy_install pip

# install python virtualenv
RUN pip install \
        virtualenv \
        virtualenvwrapper

# prepare virtualenv for ansible
ENV WORKON_HOME /opt/.venv
ENV PROJECT_HOME /opt/public
RUN mkdir -p $WORKON_HOME \
    && mkdir -p $PROJECT_HOME \
    && echo "export WORKON_HOME=$WORKON_HOME" >> /home/app/.bashrc \
    && echo "export PROJECT_HOME=$PROJECT_HOME" >> /home/app/.bashrc \
    && echo "source /usr/local/bin/virtualenvwrapper.sh" >> /home/app/.bashrc

# install ansible
RUN /usr/local/bin/virtualenv $WORKON_HOME/ansible \
    && $WORKON_HOME/ansible/bin/pip install ansible==1.5.5 \
    && ln -s $WORKON_HOME/ansible/bin/ansible* /usr/local/bin/ \
    && chown --recursive app:app $WORKON_HOME \
    && chown --recursive app:app $PROJECT_HOME

# run commands
ENV HOME /home/app
USER app
WORKDIR /home/app
ENTRYPOINT ["/usr/local/bin/ansible"]
