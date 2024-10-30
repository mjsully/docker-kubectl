#!/bin/bash

mkdir -p deployments .kube
echo "Launching kubectl container..."
docker run -it --rm \
    -v $(pwd)/.kube/config:/home/kube-admin/.kube/config \
    -v $(pwd)/deployments/:/home/kube-admin/deployments/ \
    --user 1000:1000 \
    --hostname kubectl-container \
    ghcr.io/mjsully/docker-kubectl:latest
