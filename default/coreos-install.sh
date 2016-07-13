#!/bin/bash

CURRENT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
REQUIRED=(
    'HOSTNAME'
    'DNS'
    'GATEWAY'
    'PRIVATE_IPV4'
    'CHANNEL'
    'TIMEZONE'
)

source $(dirname "${CURRENT_PATH}")/lib/common.sh
TIMEZONE=${TIMEZONE//\//\\/}

init_config
replace_required
install
