#!/bin/sh

sed -i "s/FIRESTORE_PORT_PLACEHOLDER/$FIRESTORE_PORT/g" firebase.json
sed -i "s/UI_PORT_PLACEHOLDER/$UI_PORT/g" firebase.json

echo "Launching emulator with following firebase.json config file"
cat firebase.json

firebase emulators:start