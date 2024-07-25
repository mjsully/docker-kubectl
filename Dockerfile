FROM ubuntu:22.04

RUN apt update -y
RUN apt install -y apt-transport-https ca-certificates curl gnupg

RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key \
    | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg && \
    chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg

RUN echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] \
    https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /' | \
    tee /etc/apt/sources.list.d/kubernetes.list && \
    chmod 644 /etc/apt/sources.list.d/kubernetes.list

RUN apt update -y
RUN apt install -y kubectl

RUN useradd -ms /bin/bash kube-admin
USER kube-admin
WORKDIR /home/kube-admin/