#!/bin/bash

vDockerImage="neo-dev-chain:latest"
vContainerName="neo-dev-chain"
vRpcPort=4201

function run() {
    if [[ -n $(docker ps -aq -f name=$vContainerName) ]]; then
        docker start $vContainerName
    else
        docker run --name $vContainerName \
            --cpus 1 \
            -h "neo-dev-chain" \
            -dit -p 127.0.0.1:4001-4004:4001-4004 -p 4101:4101 -p $vRpcPort:$vRpcPort \
            --restart no \
            $vDockerImage
    fi
}

function usage() {
    echo "Usage: $0 [run | start | attach | bash | stop | rm]"
}

function rpc() {
    curl -d "$1" http://localhost:$vRpcPort
    echo
}

if [[ $# == 0 ]]; then
    usage
else
    case $1 in
        "run" | "start")
            run
            ;;
        "attach")
            run
            docker attach $vContainerName
            ;;
        "bash")
            run
            docker exec -it $vContainerName bash
            ;;
        "stop")
            docker stop $vContainerName
            ;;
        "rm")
            docker stop $vContainerName
            docker rm $vContainerName
            ;;
        "test")
            rpc '{"jsonrpc": "2.0", "method": "getblockcount", "params": [], "id": 5}'
            ;;
        *) 
            usage
            ;;
    esac
fi

