#!/bin/sh

sed -i "s/FIRESTORE_PORT_PLACEHOLDER/$FIRESTORE_PORT/g" firebase.json
sed -i "s/UI_PORT_PLACEHOLDER/$UI_PORT/g" firebase.json
sed -i "s/PUSUB_PORT_PLACEHOLDER/$PUSUB_PORT/g" firebase.json
sed -i "s/FUNCTIONS_PORT_PLACEHOLDER/$FUNCTIONS_PORT/g" firebase.json

echo "Launching emulator with following firebase.json config file"
cat firebase.json

npm --prefix ./functions install
firebase emulators:start