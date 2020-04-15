#!/bin/sh
set -e

if [ -z "${HOST_ADDR}" ]; then
  echo "please set host"
  exit 1
fi

cd ${NGROK_PATH}

cp -r ngrokroot.crt /usr/local/ngrok/assets/client/tls/

cd /usr/local/ngrok
make release-server
GOOS=linux GOARCH=386 make release-client
GOOS=linux GOARCH=amd64 make release-client
GOOS=windows GOARCH=386 make release-client
GOOS=windows GOARCH=amd64 make release-client
GOOS=darwin GOARCH=386 make release-client
GOOS=darwin GOARCH=amd64 make release-client
GOOS=linux GOARCH=arm make release-client

cp -r /usr/local/ngrok/bin ${NGROK_PATH}/bin

echo "build success"