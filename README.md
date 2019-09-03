
# VPN PPTP CLIENT


## Clone
```
git clone https://github.com/corpusops/docker-pptp-client.git
cd docker-pptp-client
```

## configure

With infos from your VPN provider, fill docker.env, using docker.env.dist template (ADDRESS, USER, PASSWORD)
```
cp .env.dist .env
$EDITOR .env
docker-compose build
```

## Build
```
docker-compose build
```

## Launch VPN
```
docker-compose up -d --force-recreate
```


connect to your host
```
ssh addr_insidevpn
```
