FROM node:lts-alpine3.9

RUN apk update && apk add openjdk8

RUN npm install -g firebase-tools
RUN firebase setup:emulators:firestore

WORKDIR /firestore

COPY . .

EXPOSE 4000
EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]