#!/bin/bash
#Arguments $0, $1, $2 etc

echo "It will take inputs from argument and will create user"

sudo useradd $1

echo "User $1 created successfully"