FROM node:lts-alpine3.12

RUN apk update && apk add openjdk11 && apk add bash

RUN npm install -g firebase-tools
RUN firebase setup:emulators:firestore
RUN firebase setup:emulators:pubsub

WORKDIR /firestore

COPY . .
RUN chmod 755 entrypoint.sh

EXPOSE 4000
EXPOSE 8080
EXPOSE 8085
EXPOSE 5001

ENTRYPOINT ["./entrypoint.sh"]