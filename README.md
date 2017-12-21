# dnsmasq-docker
How to run dnsmasq as your dns server


# Build
`docker build -t dnsmasq .`

# Run
`docker run --privileged -itd dnsmasq systemd`

`docker exec -it <contianer-id> /bin/bash`

# Modify your /etc/hosts file to add new entries for testing

```
<someIP> simplename

<someIP> example.3031.net example
```

# Test it out
```
root@0f0f9501ae8c /]# systemctl start dnsmasq
[root@0f0f9501ae8c /]# nslookup example localhost
Server:		localhost
Address:	127.0.0.1#53

Name:	example
Address: 172.17.0.5

[root@0f0f9501ae8c /]# nslookup example.3031.net localhost
Server:		localhost
Address:	127.0.0.1#53

Name:	example.3031.net
Address: 172.17.0.5

[root@0f0f9501ae8c /]# nslookup simplename.3031.net localhost
Server:		localhost
Address:	127.0.0.1#53

Name:	simplename.3031.net
Address: 172.17.0.4
```
