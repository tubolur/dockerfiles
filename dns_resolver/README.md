# DNS RESOLVER Docker image

run with 
`docker run --name=my-unbound --detach=true --publish=53:53/tcp --publish=53:53/udp --restart=unless-stopped mvance/unbound:latest`
