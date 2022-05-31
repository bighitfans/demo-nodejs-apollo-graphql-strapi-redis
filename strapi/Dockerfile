FROM node:14-alpine as base

RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

WORKDIR /home/node/app

USER node

CMD npm run develop
