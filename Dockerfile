ARG NODE_VERSION=21
FROM node:${NODE_VERSION}-alpine

WORKDIR /usr/src/app

COPY ./package.json .

COPY . .

ARG DATABASE_URL
ENV DATABASE_URL=$DATABASE_URL
RUN npm install -g npm@10.8.2

RUN npx next build
RUN npx next start


EXPOSE 3001
CMD [ "npm", "run", "dev" ]
