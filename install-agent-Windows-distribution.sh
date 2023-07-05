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

Download Grafana Agent for Windows
Navigate to the latest release.
Scroll down to the Assets section.
Download the file called grafana-agent-installer.exe.zip.
You can also download the grafana-agent-installer.exe.zip asset directly from 

https://github.com/grafana/agent/releases/latest/download/grafana-agent-installer.exe.zip

Standard installation
Unzip the downloaded file.
Double-click on grafana-agent-installer.exe to install Grafana Agent.

Grafana Agent is installed into the default directory C:\Program Files\Grafana Agent. The windows_exporter integration can be enabled with all default windows_exporter options.
    

Verify the installation
Make sure you can access http://localhost:12345/-/healthy and http://localhost:12345/agent/api/v1/metrics/targets.
Optional: You can adjust C:\Program Files\Grafana Agent\agent-config.yaml to meet your specific needs. After changing the configuration file, restart the Grafana Agent service to load changes to the configuration.
Existing configuration files are kept when re-installing or upgrading the Grafana Agent.


    nohup ./grafana-agent-linux-amd64 --config.file=agent-config-${servicename}.yaml > agent-config-${servicename}.log &
    # if "field http_listen_port not found in type server.config" error message appears, then execute:
    # nohup ./grafana-agent-linux-amd64 --config.file=agent-config-${servicename}.yaml -server.http.address="0.0.0.0:12345" > agent-config-${servicename}.log &
    exit
fi
