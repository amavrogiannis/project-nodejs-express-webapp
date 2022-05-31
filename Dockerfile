FROM mhart/alpine-node:8.5.0

# Create modules dir
# RUN mkdir -p /usr/src/app/node_modules && chown -R node:node /usr/src/app/node_modules

# Create app directory
WORKDIR /usr/src/app

# Copy files to container
COPY package.json .

# Install dependencies
RUN apk add --no-cache \
    build-base \
    g++ \
    cairo-dev \
    jpeg-dev \
    pango-dev \
    bash \
    imagemagick

COPY ./ /usr/src/app

RUN npm config set strict-ssl=false
RUN npm install --force
RUN npm update

# RUN npm update

EXPOSE 3000/tcp

CMD [ "node", "app" ]

