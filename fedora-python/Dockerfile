FROM fedora:latest
RUN dnf -y upgrade && dnf -y install python2 python2-pip python3 python3-pip && dnf clean all
RUN pip2 install -U pip
RUN pip3 install -U pip
