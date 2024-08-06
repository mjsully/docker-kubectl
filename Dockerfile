FROM ubuntu:22.04

LABEL org.opencontainers.image.source=https://github.com/mjsully/docker-kubectl

COPY build.sh /
RUN chmod +x build.sh && ./build.sh
RUN rm ./build.sh
RUN useradd -ms /bin/bash kube-admin
USER kube-admin
WORKDIR /home/kube-admin/
