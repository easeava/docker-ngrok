#!/bin/sh
set -e

if [ -z "${HOST_ADDR}" ]; then
  echo "please set host"
  exit 1
fi

if [ ! -f "${NGROK_PATH}/bin/ngrokd" ]; then
    echo "ngrokd is not build, will be build it now..."
    /bin/sh /build.sh
fi


${NGROK_PATH}/bin/ngrokd -tlsKey=${NGROK_PATH}/tls.key -tlsCrt=${NGROK_PATH}/tls.crt -domain="${HOST_ADDR}" -httpAddr=${HTTP_PORT} -httpsAddr=${HTTPS_PORT} -tunnelAddr=${TUNNEL_PORT}
