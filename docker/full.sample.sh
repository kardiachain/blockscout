############# KEEP AWAY ################
export FULLSTACK=true

############# GENERAL ################
export ETHEREUM_JSONRPC_VARIANT=geth
export COIN=KAI
export COINGECKO_COIN_ID=kardiachain
export FIRST_BLOCK=1
export BLOCKSCOUT_VERSION=1.0.1
export CHAIN_ID=0

############# RPC ################
export ETHEREUM_JSONRPC_HTTP_URL=https://dev-1.kardiachain.io
export ETHEREUM_JSONRPC_WS_URL=

############# DATABASE ################
export DATABASE_URL=postgresql://postgres:123456@localhost:5432/explorer
export DB_URL=postgresql://postgres:123456@localhost:5432/explorer
export PGHOST=localhost
export PGPORT=5432
export PGDATABASE=explorer
export PGUSER=postgres
export PGPASSWORD=123456
export ECTO_USE_SSL=false
export POOL_SIZE=20

############# STATS ################
export TXS_STATS_DAYS_TO_COMPILE_AT_INIT=1
export ENABLE_POS_STAKING_IN_MENU=false
export LINK_TO_OTHER_EXPLORERS=false
export OTHER_EXPLORERS=‘{}’

docker rm -f blockscout
make index
