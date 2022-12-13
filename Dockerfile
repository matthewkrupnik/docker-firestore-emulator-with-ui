FROM node:16-bullseye-slim

RUN apt update -y && apt install -y openjdk-11-jdk bash

RUN npm install -g firebase-tools
RUN firebase setup:emulators:firestore
RUN firebase setup:emulators:pubsub

WORKDIR /firestore

COPY . .
RUN chmod 755 entrypoint.sh

ENV FIRESTORE_PORT 8080
ENV FIRESTORE_WS_PORT 5005
ENV UI_PORT 4000
ENV PUSUB_PORT 8085
ENV FUNCTIONS_PORT 5001

EXPOSE "$UI_PORT"
EXPOSE "$FIRESTORE_PORT"
EXPOSE "$FIRESTORE_WS_PORT"
EXPOSE "$PUSUB_PORT"
EXPOSE "$FUNCTIONS_PORT"

ENTRYPOINT ["./entrypoint.sh"]
