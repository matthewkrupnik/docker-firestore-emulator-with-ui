FROM node:lts

RUN apt-get update && apt-get install default-jdk -y

RUN npm install -g firebase-tools
RUN firebase setup:emulators:firestore

WORKDIR /firestore

COPY . .

EXPOSE 4000
EXPOSE 8080

ENTRYPOINT ["./entrypoint.sh"]