# Intro

Container is running Alpine linux with Node LTS, Bash, and Openjdk11 installed.
Container installs the firebase-toolkit from npm. It also installs the firestore, pubsub, andfunctions emulator and turns on the UI.

# Execute container

docker run -p 8080:8080 -p 4000:4000 -p 8085:8085 -p 5001:5001 matthewkrupnik/docker-firestore-emulator-with-ui

# Ports

 * 4000 is the UI port
 * 8080 is the firestore port
 * 8085 is the pubsub port
 * 5001 is the functions port

# Mountpoints

 * firestore.indexes.json is found at /firebase/firestore.indexes.json
 * firestore.rules is found at /firebase.rules
 * functions need to be loaded at /firestore/functions

 # Firestore

To use firestore emulator the environment variable needs to be set.
FIRESTORE_EMULATOR_HOST="localhost:8080"

# PubSub

PUBSUB_EMULATOR_HOST="localhost:8085"

# Functions

You functions folder needs to be volume mounted to /firestore/functions. The following npm packages are required:

* "firebase-admin": "^8.10.0",
* "firebase-functions": "^3.6.1"

The container will run an npm install on the functions repository and the settings are as follows:

```json
"functions": {
    "predeploy": [
      "npm --prefix ./functions run lint",
      "npm --prefix ./functions run build"
    ],
    "source": "functions"
  }
```