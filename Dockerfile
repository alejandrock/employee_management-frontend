FROM node:lastest as builder

RUN mkdir -p /app


WORKDIR /app

COPY . .

RUN npm install
RUN npm run build --prod
RUN docker export DOCKER_BUILDKIT=0
RUN docker export COMPOSE_DOCKER_CLI_BUILD=0
CMD ["npm", "start"]

