#!/bin/bash

PLATFORM=$(uname -i)

if [ $PLATFORM == "x86_64" ]
then
    apt update -y;
    apt install -y curl;
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl";
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
elif [[ $PLATFORM == "linux/arm64" || $PLATFORM == "linux/aarch64" ]]
then
    apt update -y;
    apt install -y curl;
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl";
    curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl.sha256"
else
    echo "Unsupported platform";
    exit 1;
fi
CHECKSUM_VALID = $(echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check);
if [ $CHECKSUM_VALID != 0 ]
then
    echo "Checksum is invalid, exiting";
    exit 1;
fi
install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl;