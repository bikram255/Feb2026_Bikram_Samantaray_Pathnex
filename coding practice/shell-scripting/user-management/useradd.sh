#!/bin/bash
# Developer: Bikram Samantaray
# Script to add user

read -p "Enter Your Full Name:" fullname
read -p "Enter Your username:" username

#Create user
echo "Started creating new user"
sudo useradd -m -s /bin/bash -c "$fullname" "$username"
echo "Successfully created user $username"


#Create Password for user
echo "Create password for $username user"
sudo passwd $username

uid=$(id -u $username)
gid=$(id -g $username)


echo "================================="
echo " User $username created succesfully"
echo " Username: $username"
echo " Homepath: /home/$username"
echo " Shell: /bin/bash"
echo " UID: $uid"
echo " GID: $gid"
echo "================================="