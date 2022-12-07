# Intro
Fork of [https://github.com/matthewkrupnik/docker-firestore-emulator-with-ui](https://github.com/matthewkrupnik/docker-firestore-emulator-with-ui)
to expose the ports of the emulator through environment variables


Container is running Alpine linux with Node LTS, Bash, and Openjdk11 installed.
Container installs the firebase-toolkit from npm. It also installs the firestore, pubsub, andfunctions emulator and turns on the UI.

# Execute container

`docker run -p 8080:8080 -p 4000:4000 -p 8085:8085 -p 5001:500 -p 5005:5005 matthewkrupnik/docker-firestore-emulator-with-ui`

Execute the container exposing the firestore server on the port 8200 instead of the standard 8080
`docker run -e FIRESTORE_PORT=8200 -p 8200:8200 -p 4000:4000 -p 8085:8085 -p 5001:5001 -p 5005:5005 matthewkrupnik/docker-firestore-emulator-with-ui`

# Env variables and ports

* FIRESTORE_PORT default to 8080
* FIRESTORE_WS_PORT default to 5005
* UI_PORT default to 4000
* PUSUB_PORT default to 8085
* FUNCTIONS_PORT default to 5001

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