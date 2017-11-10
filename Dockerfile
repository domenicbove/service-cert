FROM registry.access.redhat.com/jboss-amq-6/amq63-openshift
MAINTAINER Domenic Bove <dbove@redhat.com>
USER root
RUN yum install -y openssl && \
    yum clean all
COPY startup.sh /etc/scripts/startup.sh
RUN chgrp -R 0 /etc/scripts/ && \
    chmod -R g=u /etc/scripts/
USER 1001
CMD ["/etc/scripts/startup.sh"]
