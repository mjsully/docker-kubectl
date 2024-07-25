# docker-kubectl
This image enables the use of kubectl without installation on the host machine. To run, use the following command:
```
docker run -it --rm \
    -v $(pwd)/.kube/config:/home/kube-admin/.kube/config \
    --hostname kubectl-container \
    ghcr.io/mjsully/docker-kubectl:latest
```
