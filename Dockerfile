FROM storm:2.2.0
LABEL maintainer="dalmatialab"

RUN apt update && apt install -y python3 python3-pip openssh-server
RUN rm /usr/bin/python && ln -s /usr/bin/python3.7 /usr/bin/python

RUN adduser --gecos "" --disabled-password admin
RUN echo "admin:admin" | chpasswd

RUN pip3 install virtualenv

ENV ZOOKEEPER_SERVICE=zookeeper
ENV NIMBUS_SERVICE=nimbus

ADD src/run.sh /run.sh
ADD src/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod a+x /run.sh
RUN chmod a+x /docker-entrypoint.sh
RUN mkdir /venvs && chmod 777 /venvs

ENTRYPOINT ["/run.sh"]
