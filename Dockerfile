# FROM mhart/alpine-node:8.5.0
FROM ubuntu:latest

# Create modules dir
# RUN mkdir -p /usr/src/app/node_modules && chown -R node:node /usr/src/app/node_modules

# Create app directory
WORKDIR /usr/src/app

# Copy files to container
COPY package.json .

# Install dependencies
# RUN apk add --no-cache \
#     build-base \
#     g++ \
#     cairo-dev \
#     jpeg-dev \
#     pango-dev \
#     bash \
#     imagemagick

RUN apt-get update && apt-get install -y
RUN apt-get -y install nodejs npm


COPY ./ /usr/src/app

RUN npm config set strict-ssl=false
RUN npm install
RUN npm install -g npm@latest --force
RUN npm cache clean --force

# RUN npm update

EXPOSE 3000/tcp

CMD [ "node", "app" ]

