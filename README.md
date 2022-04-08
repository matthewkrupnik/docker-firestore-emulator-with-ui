# Overview
Fork of the good work done here: [https://github.com/matthewkrupnik/docker-firestore-emulator-with-ui](https://github.com/matthewkrupnik/docker-firestore-emulator-with-ui)


Slightly modified to only run firestore with the UI for my own use-case.


Container is running Alpine linux with Node LTS, Bash, and Openjdk11 installed.
Container installs the firebase-toolkit from npm. It also installs the firestore and turns on the UI.


# Build container from git

At some stage, I'll push this image to Docker Hub, but for now, you can build and tag the image by running the below:

```~$ docker build https://github.com/jordanbalsamo/docker-firestore-emulator-with-ui.git#master -t firestore-emulator-ui```

Note: the rest of the commands in this README will assume you've built the image using this method.

# Run container

Run the container with firestore default ports

```~$ docker run -p 8080:8080 -p 4000:4000 jordanbalsamo/firestore-emulator-ui`


Run the container with custom ports

```~$ docker run -e FIRESTORE_PORT=8200 -p 8200:8200 -p 4000:4000 firestore-emulator-ui ```

# Environment variables and ports

By default, the ports are set as follows:

* FIRESTORE_PORT default to 8080
* UI_PORT default to 4000

To modify the default ports, see above `Run the container with custom ports`.

# Mountpoints

* firestore.indexes.json is found at /firebase/firestore.indexes.json
* firestore.rules is found at /firebase.rules
* functions need to be loaded at /firestore/functions

# Firestore

To use firestore emulator the environment variable needs to be set.

```FIRESTORE_EMULATOR_HOST="localhost:8080" # remember to change this if customising default ports```