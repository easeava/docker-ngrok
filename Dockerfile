FROM golang:1.14-alpine
LABEL ease <easeava@gmail.com>

RUN apk add --no-cache git make

# RUN cd /usr/local && git clone https://github.com/inconshreveable/ngrok.git ./ngrok

ADD ngrok /usr/local/ngrok
ADD *.sh /

ENV HOST_ADDR null
ENV NGROK_PATH /ngrok
ENV TUNNEL_PORT :4443
ENV HTTP_PORT :80
ENV HTTPS_PORT :443

EXPOSE 4443
EXPOSE 80
EXPOSE 443

CMD /bin/sh