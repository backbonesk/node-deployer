FROM node:16.4.2

RUN mkdir /app
WORKDIR /app

COPY . .

RUN npm install --save
