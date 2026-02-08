✅ What is a Variable in Shell?

A variable is just a container that stores a value.
Think like:
👉 “Name tag for data”
Example:
name="Bikram"

Now name stores "Bikram".
✅ 1. Creating Variables (Syntax)
⚠️ IMPORTANT RULE
❌ No spaces around =
Correct
name="Bikram"
age=30

Wrong
name = "Bikram"   ❌

✅ 2. Accessing Variables
Use $ to read value.
echo $name
Output:
Bikram

OR (best practice)

echo ${name}
✅ 3. Types of Variables in Shell
🟢 1. User Defined Variables

You create them.
#!/bin/bash
user="devops"
port=8080

echo "User is $user"
echo "Port is $port"

🟢 2. System Variables (Environment Variables)
Linux already provides them.

echo $HOME
echo $USER
echo $PWD
echo $PATH

Common ones you must know for interviews:
Variable	Meaning
$HOME	home directory
$USER	current user
$PWD	current directory
$PATH	executable paths
$?	last command status
$$	process id
🟢 3. Command Output Variables

Store command output using $( )
today=$(date)
echo "Today is $today"

OR

files=$(ls)

💡 Very useful in DevOps scripts.

Example:
instance_id=$(curl http://169.254.169.254/latest/meta-data/instance-id)

✅ 4. Taking Input from User
You already used this in your useradd script 👍

read -p "Enter username: " username
echo "Hello $username"

✅ 5. Readonly Variables
Cannot change value.
readonly pi=3.14
pi=4      # ❌ error

✅ 6. Export Variables (Environment)
Used when child processes need access.
export APP_ENV=production

Useful for:
Jenkins
Docker
CI/CD
Terraform
Example:
export AWS_REGION=ap-south-1

✅ 7. Special Variables (Very Important for Interviews)
Script arguments
./script.sh devops aws

Inside script:
echo $0   # script name
echo $1   # devops
echo $2   # aws
echo $#   # number of args
echo $@   # all args

✅ 8. Practical DevOps Examples (You’ll actually use)
Example 1 – Backup Script
#!/bin/bash

backup_dir="/backup"
date=$(date +%F)

tar -czf ${backup_dir}/backup-${date}.tar.gz /home

Example 2 – EC2 User Creation
#!/bin/bash

read -p "Enter username: " user
sudo useradd $user
echo "User $user created successfully"

Example 3 – Status Check
systemctl status nginx
if [ $? -eq 0 ]
then
  echo "Nginx running"
else
  echo "Nginx stopped"
fi

✅ Interview Quick Revision
If interviewer asks:
👉 “Types of variables in shell?”

Answer:
User-defined, system/environment, positional/special variables.
👉 “How to store command output?”
Using $(command)
👉 “Difference between local and export?”
local → current shell
export → available to child processes