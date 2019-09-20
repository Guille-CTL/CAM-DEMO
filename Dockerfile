FROM node:8.1.0-alpine

ARG IMAGE_CREATE_DATE
ARG IMAGE_VERSION

# Metadata as defined in OCI image spec annotations - https://github.com/opencontainers/image-spec/blob/master/annotations.md
LABEL org.opencontainers.image.title="Hello Kubernetes!" \
      org.opencontainers.image.description="Provides a demo image to deploy to a Kubernetes cluster. It displays a message, the name of the pod and details of the node it's deployed to." \
      org.opencontainers.image.created=$IMAGE_CREATE_DATE \
      org.opencontainers.image.version=$IMAGE_VERSION

# Create app directory

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

CMD [ "npm", "start" ]