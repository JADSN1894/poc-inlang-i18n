FROM node:20.2.0-bullseye-slim

RUN groupmod -g 1000 node && usermod -u 1000 -g 1000 node

RUN apt -yq update && apt -yq upgrade && export DEBIAN_FRONTEND=noninteractive

RUN apt -yqq install --no-install-recommends curl ca-certificates \
    build-essential pkg-config python3 \
    wget git curl iproute2 tar jq unzip 

RUN npm install -g npm@latest

WORKDIR /usr/local/bin

COPY ./install_packages.sh ./install_packages.sh

RUN chmod +x ./install_packages.sh

RUN /bin/bash -c ./install_packages.sh

RUN chown -R node /usr/local/bin