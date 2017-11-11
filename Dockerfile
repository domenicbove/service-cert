FROM registry.access.redhat.com/jboss-amq-6/amq63-openshift

MAINTAINER Domenic Bove <dbove@redhat.com>

USER root

RUN yum install -y openssl && \
    yum clean all

COPY startup.sh /etc/scripts/startup.sh

RUN chmod -R u+x /etc/scripts/ && \
    chgrp -R 0 /etc/scripts/ && \
    chmod -R g=u /etc/scripts/

RUN mkdir /etc/certs/ && \
    chmod -R u+x /etc/certs/ && \
    chgrp -R 0 /etc/certs/ && \
    chmod -R g=u /etc/certs/

USER 1001

CMD . /etc/scripts/startup.sh
