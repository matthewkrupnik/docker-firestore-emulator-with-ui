FROM node:lts-alpine3.14

RUN apk update && apk add openjdk11 && apk add bash

RUN npm install -g firebase-tools
RUN firebase setup:emulators:firestore

WORKDIR /firestore

COPY . .
RUN chmod 755 entrypoint.sh

ENV FIRESTORE_PORT 8080
ENV FIRESTORE_PROJECT_ID "dummy-firestore-id"
ENV UI_PORT 4000

EXPOSE "$UI_PORT"
EXPOSE "$FIRESTORE_PORT"

ENTRYPOINT ["./entrypoint.sh"]
