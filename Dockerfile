FROM node:16.4.2

RUN apt-get update && apt-get install -y openssl

RUN npm i -g babel
RUN npm i -g git+https://github.com/backbonesk/ssh-deploy-release.git#411a913a71b0f2ff54aa39a6d2e4f3ad65db2fed
