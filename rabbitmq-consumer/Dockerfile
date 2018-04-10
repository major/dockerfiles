FROM fedora:27
RUN echo "fastestmirror=True" >> /etc/dnf/dnf.conf
RUN dnf -y install bind-utils curl librabbitmq-tools python wget && dnf clean all
ADD consumer.sh /tmp/consumer.sh
CMD ["/bin/bash", '-c', '/tmp/consumer.sh']
