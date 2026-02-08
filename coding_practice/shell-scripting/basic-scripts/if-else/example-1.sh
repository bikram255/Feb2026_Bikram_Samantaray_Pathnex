#!/bin/bash

read -p "Enter a number: " num
if [[ $num -gt 0 ]]
then
    echo " $num is greater than 0"
else
    echo " $num is less than 0"
fi