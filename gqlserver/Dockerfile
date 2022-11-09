FROM node:lts-alpine as base

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

WORKDIR /home/node/app

RUN npm install -g nodemon

USER node

CMD nodemon --trace-warnings
