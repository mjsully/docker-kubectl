![Github All Releases](https://img.shields.io/github/downloads/mjsully/docker-kubectl/total)
# Kubectl in a Docker container
This container packages [kubectl](https://kubernetes.io/docs/reference/kubectl/) into an Alpine container. This image was built to allow portable management of my k3s cluster on any device which has Docker installed (and access to the kube config file).
## Deployment
An example `docker run` command is provided below:
```
docker run -it --rm \
    -v $(pwd)/.kube/config:/home/kube-admin/.kube/config \
    --hostname kubectl-container \
    ghcr.io/mjsully/docker-kubectl:latest
```
