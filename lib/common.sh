#!/bin/bash

CLOUD_CONFIG_FILE=${CLOUD_CONFIG_FILE:=$CURRENT_PATH/cloud-config.yaml}
CONFIG_FILE=${CONFIG_FILE:=$CURRENT_PATH/config}

if [ -z $CURRENT_PATH ]; then
    echo "Missing required config value: CURRENT_PATH"
    exit 1
fi

if [ ! -f "$CONFIG_FILE" ]; then
    echo "$CONFIG_FILE File not found!"
    exit 1
fi

if [ ! -f "${CLOUD_CONFIG_FILE}" ]; then
    echo "${CLOUD_CONFIG_FILE} File not found!"
    exit 1
fi

source $CONFIG_FILE

if [ -z $REQUIRED ]; then
    echo "Missing required config value: REQUIRED"
    exit 1
fi

function init_config {
    for REQ in "${REQUIRED[@]}"; do
        if [ -z "$(eval echo \$$REQ)" ]; then
            echo "Missing required config value: ${REQ}"
            exit 1
        fi
    done
}

function replace_required {
    for REQ in "${REQUIRED[@]}"; do
        sed -i "s/\$$REQ/$(eval echo \$$REQ)/g" $CLOUD_CONFIG_FILE
    done
}

function install {
    local DEVICE=${DEVICE:=/dev/sda}
    local CHANNEL=${CHANNEL:=stable}

    sudo coreos-install -d $DEVICE -C $CHANNEL -c $CLOUD_CONFIG_FILE
}
