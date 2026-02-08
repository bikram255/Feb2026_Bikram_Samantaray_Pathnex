#!/bin/bash
# Author Bikram Samantaray

echo "Hello This is the first day and first file for shell scripting"

name="Bikram Samantaray"
echo "My name is $name and today's date is $(date)"

read -p "Enter your role: " role
echo "Your role is $role"

read -p "Enter your organization name: " org
echo "Your organization is $org"

read -p "Enter username to add a new user:" username
sudo useradd $username
echo "New user added"