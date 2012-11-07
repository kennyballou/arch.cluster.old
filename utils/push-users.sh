#!/bin/bash

SCRIPT_NAME=`basename $0`
pushd `dirname $0` > /dev/null
SCRIPT_PATH=`pwd`
popd > /dev/null

# parse arguments
declare -a args
while (( $# )); do
    case "$1" in
        *)
            args+=("$1")
            ;;
    esac
    shift
done

# test for minimum number of arguments
if [[ -z ${args[0]-} ]]; then
    echo "usage: ${SCRIPT_PATH} <node#>"
    exit 1
fi

NODE_NUMBER=${args[0]}
NODE_IP=192.168.1.${NODE_NUMBER}

rsync /etc/passwd /etc/shadow /etc/group /etc/gshadow ${NODE_IP}:/etc/
