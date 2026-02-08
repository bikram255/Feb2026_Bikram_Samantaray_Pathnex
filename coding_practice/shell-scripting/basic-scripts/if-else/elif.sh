#!/bin/bash

read -p "Enter your marks: " mark

if [[ "$mark" -ge 90 ]]
then
	echo "Grade-A"
elif [[ "$mark" -ge 70 ]]
then
	echo "Grade-B"
elif [[ "$mark" -ge 30 ]]
then
	echo "Pass"
else
	echo "Fail"
fi