FROM node:16.4.2-slim as builder

RUN apt-get update
RUN apt-get install -y openssl libssl-dev python make yarn git

WORKDIR /opt

RUN git clone https://github.com/backbonesk/ssh-deploy-release.git ssh-deploy-release
WORKDIR /opt/ssh-deploy-release

RUN npm i
RUN npm pack

FROM node:16.4.2-slim

RUN mkdir /opt/node-deployer
COPY --from=builder /opt/ssh-deploy-release/ssh-deploy-release-3.0.5.tgz /opt/node-deployer/ssh-deploy-release-3.0.5.tgz
WORKDIR /opt/node-deployer

RUN npm i -g ssh-deploy-release-3.0.5.tgz
COPY deploy.js deploy.js
