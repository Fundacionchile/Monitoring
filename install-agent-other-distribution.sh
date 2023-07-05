#!/bin/bash

# Input parameters
if [[ ( $# -ne 1 ) ]]; then
    if [ ! -f "$config_file" ]; then
        echo "There are not service name."
        echo "Input the subsystem name (Required: sml smc)"
        echo "Or input the service name (docker elasticsearch kafka linux-server minio nginx postgresql rabbitmq redis vault)"
        read servicename
    fi
else
    servicename=$1
fi

if [[ $servicename != "" ]]; then
    curl -O -L "https://github.com/grafana/agent/releases/latest/download/grafana-agent-linux-amd64.zip";
    unzip "grafana-agent-linux-amd64.zip";
    chmod a+x "grafana-agent-linux-amd64";

    nohup ./grafana-agent-linux-amd64 --config.file=agent-config-${servicename}.yaml > agent-config-${servicename}.log &
    # if "field http_listen_port not found in type server.config" error message appears, then execute:
    # nohup ./grafana-agent-linux-amd64 --config.file=agent-config-${servicename}.yaml -server.http.address="0.0.0.0:12345" > agent-config-${servicename}.log &
    exit
fi
