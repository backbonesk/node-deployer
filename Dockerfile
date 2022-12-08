FROM node:16-slim

RUN mkdir /opt/node-deployer
WORKDIR /opt/node-deployer

RUN npm i -g ssh-deploy-release
COPY deploy.js deploy.js
