#!/bin/bash

CURRENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REQUIRED=(
    'HOSTNAME'
    'DNS'
    'GATEWAY'
    'PRIVATE_IPV4'
    'CLUSTER0_IPV4'
    'CLUSTER1_IPV4'
    'CLUSTER2_IPV4'
    'CLUSTER_TOKEN'
    'CLUSTER_NAME'
    'CLUSTER0_NAME'
    'CLUSTER1_NAME'
    'CLUSTER2_NAME'
    'CHANNEL'
    'TIMEZONE'
)

source $(dirname "${CURRENT_PATH}")/lib/common.sh
TIMEZONE=${TIMEZONE//\//\\/}

init_config
replace_required
install
