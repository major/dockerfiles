FROM fedora:27
RUN echo "fastestmirror=True" >> /etc/dnf/dnf.conf
ADD dnf-transaction.txt /tmp/dnf-transaction.txt
RUN dnf -y shell /tmp/dnf-transaction.txt && rm -f /tmp/dnf-transaction.txt
ADD consumer.sh /tmp/consumer.sh
CMD /tmp/consumer.sh
