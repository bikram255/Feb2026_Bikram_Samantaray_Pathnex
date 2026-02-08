Variables:
================================================
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





Command line arguments:
==================================================================
✅ 7. Special Variables (Very Important for Interviews)
Script arguments
./script.sh devops aws

Inside script:
| Parameter | Meaning                       |
| --------- | ----------------------------- |
| $0        | Script name                   |
| $1–$9     | Arguments                     |
| $#        | Number of arguments           |
| $@        | All arguments (separate)      |
| $*        | All arguments (single string) |
| $?        | Last command status           |
| $$        | Process ID                    |

✅ What is $? in Shell?
Definition

$? stores the exit status (return code) of the last executed command.

✅ Exit Status Meaning
Value	Meaning
0	Success ✅
Non-zero (1–255)	Failure ❌

👉 Linux rule:
0 = success
anything else = error

✅ Basic Example
ls
echo $?

If directory exists:
0

If directory does NOT exist:

ls abc
echo $?

Output:

ls: cannot access abc: No such file
2

So:
👉 2 = error

✅ Why DevOps Engineers Use $?

Because scripts must:
verify installs
check service status
confirm deployments
stop pipeline on failure

✅ Real Practical Examples
🔹 Example 1 — Check command success
mkdir test
echo $?

If success:
0

🔹 Example 2 — Using with if condition (most common)
#!/bin/bash
systemctl start nginx
if [ $? -eq 0 ]
then
  echo "Nginx started successfully"
else
  echo "Failed to start Nginx"
fi

🔹 Example 3 — File copy validation (very common in production)
cp app.war /opt/tomcat/webapps/

if [ $? -eq 0 ]
then
  echo "Deployment successful"
else
  echo "Deployment failed"
  exit 1
fi

👉 Used in:
Jenkins pipelines
CI/CD
Deployment scripts
🔹 Example 4 — Short form (professional style)
Instead of $?, many engineers directly do:
if systemctl restart nginx
then
  echo "Success"
else
  echo "Failed"
fi

Because:
👉 shell automatically checks exit code.
This is cleaner.

✅ Example – Print all arguments
#!/bin/bash
echo "Script name: $0"
echo "Total args: $#"
echo "All args: $@"

Run:

./test.sh devops aws linux

✅ Loop through arguments
for arg in "$@"
do
  echo $arg
done

Output:

devops
aws
linux

📌 3. Practical DevOps Examples
✅ Example 1 – Create user from argument
#!/bin/bash
sudo useradd -m $1
echo "User $1 created successfully"

Run:

./create_user.sh bikram

✅ Example 2 – Backup with date variable
#!/bin/bash
backup_file="backup_$(date +%F).tar.gz"
tar -czf $backup_file /home/ec2-user

✅ Example 3 – Check if argument provided
if [ $# -eq 0 ]
then
  echo "Please provide filename"
  exit 1
fi

👉 Very common interview question
📌 4. Best Practices

✅ Use meaningful names
✅ Always quote variables → "$var"
✅ Validate arguments
✅ Add comments
✅ Use #!/bin/bash shebang

🎯 Interview Quick Answers
❓ What is a variable?

A container to store data in a script.
❓ Difference between $@ and $* ?
$@ → separate arguments
$* → single string
❓ How to get number of arguments?
$#

🚀 Quick Summary
name="Bikram"
echo $name

read user
echo $user

./script.sh arg1 arg2

$1 $2 $# $@
