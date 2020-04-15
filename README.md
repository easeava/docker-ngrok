```
docker pull easeava/ngrok
```

> 编译
```
docker run -it --rm --name ngrok-server -v /path:/ngrok -e HOST_ADDR="ngrok.smhx.net" easeava/ngrok /bin/sh /build.sh
```

> 监听
```
run -it --rm --name ngrok-server -v /Users/ease/work/docker/ssl:/ngrok -p 8080:80 -p 8443:443 -p 4443:4443  -e HOST_ADDR="ngrok.smhx.net" easeava/ngrok /bin/sh /server.sh
```