# Docker-compose configuration

Runs BlockScout locally in Docker container with usage [docker-compose](https://github.com/docker/compose).

## Prerequisites

- Docker v20.10+
- Docker-compose 2.x.x+
- Running Ethereum JSON RPC client
- Postgres 14.x+ database which will be available at port 5432 on localhost or private ip:

## Configs for `docker-compose-postgres.yaml` in environment section:
```      
   POSTGRES_USER: <USERNAME>
   POSTGRES_PASSWORD: <PASSSWORD>
```
then run postgres db container:

```bash
docker-compose -f docker-compose-postgres.yaml up -d
```

## Building Docker containers from source

```bash
docker-compose up --build
```

This command uses `docker-compose-no-build-geth.yml`, which build the explorer into Docker image and runs 2 Docker containers:
- one for redis caching which will be available at port 6379 on localhost or private ip
- [smart-contract-verifier](https://github.com/blockscout/blockscout-rs/) service, which will be available at port 8043 on localhost or private ip
- and the BlockScout explorer at http://<explorer_ip>:4000

## Config for `envs/common-blockscout.env`  
```
    CHAIN_ID=7331  ### for testnet
```
## Configs for different Ethereum clients

Also, the repo contains built-in configs for different clients without need to build the image

## Configs for `docker-compose-no-build-geth.yaml` in environment section:

All of the configs assume, that the Ethereum JSON RPC is running at http://<rpc_ip>:8545.

```
    ETHEREUM_JSONRPC_HTTP_URL: http://<rpc_ip>:8545
    DATABASE_URL: postgresql://<postgres_username>:<postgres_password>@<postgres_ip>:5432/blockscout?ssl=false
```
### Running blockscout explorer at http://<explorer_ip>:4000
```bash
    docker-compose -f docker-compose-no-build-geth.yml up -d
```