# DNS RESOLVER Docker image

run with 
`podman run --name unbound --detach=true --publish=53:53/tcp --publish=53:53/udp --restart=unless-stopped --volume $HOME/dev/dockerfiles/dns_resolver/forward-records.conf:/opt/unbound/etc/unbound/forward-records.conf:ro localhost/dnsresolver:1.0`
