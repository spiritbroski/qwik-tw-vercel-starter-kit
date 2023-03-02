FROM node:16-alpine
USER node
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./



RUN npm install

COPY --chown=node:node . /home/node/app
RUN npm run build
EXPOSE 3000

CMD [ "node", "server/entry.express.js" ]