#!/bin/bash

echo "Launching kubectl container..."

while getopts "b" flag; do
    case $flag in
        b) docker build -t kubectl:latest . && clear;;
    esac
done
docker run -it --rm \
    -v $(pwd)/.kube/config:/home/kube-admin/.kube/config \
    -v $(pwd)/deployments/:/home/kube-admin/deployments/ \
    --hostname kubectl-container \
    kubectl:latest