#!/bin/bash

service="docker"

if systemctl is-active --quiet $service
then
    echo "Docker is running"
else
    echo "Docker is stopped"
fi
