FROM base

MAINTAINER Tegan Snyder "tsnyder@tegdesign.com"

# https://github.com/dotcloud/docker/issues/1024
RUN dpkg-divert --local --rename --add /sbin/initctl
RUN ln -s /bin/true /sbin/initctl

# install mysql
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y openssh-server supervisor mysql-server

# not only localhost
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

ADD ./set-access-rights.sh /tmp/set-access-rights.sh
RUN /bin/sh /tmp/set-access-rights.sh

RUN mkdir -p /var/run/sshd
RUN mkdir -p /var/log/supervisor

RUN     /bin/sh -c 'echo root:testpass | chpasswd'
ADD     supervisord.conf /etc/supervisor/conf.d/supervisord.conf
EXPOSE  3306 22
cmd     ["/usr/bin/supervisord", "-n"]
