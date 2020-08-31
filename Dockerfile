FROM node:lts

RUN apt update && apt install -y default-jre && java -version

RUN npm install -g firebase-tools
RUN firebase setup:emulators:firestore && firebase setup:emulators:pubsub

WORKDIR /firestore

COPY . .
RUN chmod 755 entrypoint.sh

EXPOSE 4000
EXPOSE 8080
EXPOSE 8085

ENTRYPOINT ["./entrypoint.sh"]