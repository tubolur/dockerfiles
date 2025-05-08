# DNS RESOLVER Docker image

run with 
`docker run --name my-unbound --detach=true --publish=53:53/tcp --publish=53:53/udp --restart=unless-stopped --volume $(pwd)/forward-records.conf:/opt/unbound/etc/unbound/forward-records.conf:ro mvance/unbound:latest`
