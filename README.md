# Intro

Container is running Alpine linux with Node LTS and Openjdk8 installed.
Container installs the firebase-toolkit from npm. It also installs the firestore emulator and turns on the UI.

# Execute container

docker run -p 4000:4000 -p 8080:8080 firestore

# Ports

 * 4000 is the UI port
 * 8080 is the firestore port

# Mountpoints

 * firestore.indexes.json is found at /firebase/firestore.indexes.json
 * firestore.rules is found at /firebase.rules