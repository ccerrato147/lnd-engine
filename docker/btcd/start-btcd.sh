#!/usr/bin/env bash

# exit from script if error was raised.
set -e

# Copy certs to the shared file
[[ -e /secure/rpc.cert ]] && cp /secure/rpc.cert /shared

if [[ "$NETWORK" == "simnet" ]]; then
    crond -L /jobs/cron.log
fi

PARAMS=$(echo \
    "--$NETWORK" \
    "--debuglevel=$DEBUG" \
    "--rpcuser=$RPC_USER" \
    "--rpcpass=$RPC_PASS" \
    "--datadir=$DATA_DIR" \
    "--logdir=$LOG_DIR" \
    "--rpccert=$RPC_CERT" \
    "--rpckey=$RPC_KEY" \
    "--rpclisten=$RPC_LISTEN" \
    "--txindex"
)

# Set the mining flag only if address is non empty.
if [[ -n "$MINING_ADDRESS" ]]; then
    PARAMS="$PARAMS --miningaddr=$MINING_ADDRESS"
fi

exec btcd $PARAMS
