FROM node:lts-alpine3.12

RUN apk update && apk add openjdk11

RUN npm install -g firebase-tools
RUN firebase setup:emulators:firestore

WORKDIR /firestore

COPY . .
RUN chmod 755 entrypoint.sh

WORKDIR /firestore/functions
RUN npm install
RUN npm run build
WORKDIR /firestore

EXPOSE 4000
EXPOSE 5001
EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]