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




✅ local -r in Shell Script (Bash)
======================================================================
local -r means:
Create a variable that is local to the function AND read-only
So it cannot be changed outside or inside the function after assignment.
local -r var_name=value
Equivalent to:
    local var_name=value
    readonly var_name
📌 Step-by-step meaning
✅ local

Variable exists only inside function
Not accessible outside
Prevents global pollution

✅ -r (readonly)

Value cannot be modified
Protects from accidental changes
✅ Example 1 — Only local
myfunc() {
  local name="Bikram"
  echo $name
}

myfunc
echo $name   # ❌ empty (not accessible)

👉 Scope limited to function
✅ Example 2 — Only readonly
readonly pi=3.14
pi=10


Output:
bash: pi: readonly variable

👉 Cannot change
✅ Example 3 — local -r (combined)
myfunc() {
  local -r role="DevOps"
  echo $role

  role="Admin"   # ❌ error
}

myfunc
Output:
bash: role: readonly variable

👉

local scope ✅
immutable value ✅

📌 Why we use local -r (Real DevOps use cases)
✅ Protect constants inside functions
create_backup() {
  local -r backup_dir="/backup"
  tar -czf "$backup_dir/app.tar.gz" /app
}

👉 No one accidentally changes backup_dir
✅ Prevent bugs in big scripts

Without local:
count=10
myfunc() {
  count=5   # modifies global variable ❌
}

Bug happens 😬
With local:
myfunc() {
  local count=5   # safe ✅
}

✅ Interview Answer (short & perfect)
If asked:

👉 What is local -r in shell?
You can say:

"local -r declares a variable inside a function that is both local in scope and read-only. It cannot be modified and is not accessible outside the function. It is used to protect constants and avoid accidental changes."

✅ Quick Comparison
Keyword	Scope	Modifiable
var=10	Global	Yes
local var=10	Local	Yes
readonly var=10	Global	No
local -r var=10	Local	No ✅

👉 read -r
👉 readonly -r (or declare -r)
Both use -r, but meanings are totally different.
Let’s clear it gently and cleanly.

✅ 1️⃣ read -r → raw input (NOT readonly)
This belongs to read command
Meaning:

👉 -r = raw mode
👉 Don’t treat \ as escape
Example
read -r name
Backslashes stay exactly as typed.

✅ 2️⃣ readonly or declare -r → read-only variable
This belongs to different command
Meaning:

👉 -r = readonly
Example
declare -r name="Bikram"
Now:
name="Rahul"


❌ Error:
readonly variable

🎯 Simple Comparison
Command	-r meaning
read -r	raw input
declare -r	readonly variable
readonly	readonly variable
🔥 Easy memory trick

Think like this:
For read
👉 r = raw
For declare
👉 r = readonly

Different commands → different meanings.



✅ All Numeric Operators (must memorize for interviews)
================================================================
Operator	Meaning	Example
-eq	equal	[ $a -eq $b ]
-ne	not equal	[ $a -ne $b ]
-gt	greater than	[ $a -gt $b ]
-lt	less than	[ $a -lt $b ]
-ge	greater or equal	[ $a -ge $b ]
-le	less or equal	[ $a -le $b ]
✅ Important Rule (very common mistake)
❌ Wrong (for numbers)
[ $num > 10 ]
This means string comparison, not numeric.
✅ Correct
[ $num -gt 10 ]



tr
===================================================================
🐧 tr command in Shell Script
✅ What is tr?
tr (translate) is used to translate, replace, or delete characters from input.
It reads from stdin and writes to stdout.

🔹 Basic Syntax
tr [options] SET1 SET2
Meaning:

SET1 → characters to replace

SET2 → replacement characters

📌 Most Common Uses
✅ 1. Convert lowercase → uppercase
echo "devops" | tr 'a-z' 'A-Z'
Output:
DEVOPS

✅ 2. Convert uppercase → lowercase
echo "LINUX" | tr 'A-Z' 'a-z'
Output:
linux

✅ 3. Replace characters
echo "2026/02/08" | tr '/' '-'
Output:
2026-02-08

👉 Very useful for date formatting

✅ 4. Delete characters (-d)
echo "hello123" | tr -d '0-9'
Output:
hello

👉 Remove numbers/special chars

✅ 5. Remove extra spaces (-s squeeze)
echo "hello     world" | tr -s ' '
Output:
hello world

👉 Compress multiple spaces into one

✅ 6. Replace newline with space
cat file.txt | tr '\n' ' '

👉 Convert multi-line → single line

📌 Real DevOps Examples (very useful for you)
✅ Example 1 — Username lowercase
read username
username=$(echo "$username" | tr 'A-Z' 'a-z')

👉 Standardize usernames

✅ Example 2 — Clean logs
cat app.log | tr -d '\r'

👉 Remove Windows carriage return characters

✅ Example 3 — Generate random password
cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 12

👉 Often used in automation scripts

✅ Example 4 — CSV to space
echo "aws,linux,docker" | tr ',' ' '
Output:
aws linux docker

📌 Important Notes
⚠️ tr works only with stdin

❌ Wrong:

tr 'a-z' 'A-Z' file.txt

✅ Correct:
cat file.txt | tr 'a-z' 'A-Z'

or
tr 'a-z' 'A-Z' < file.txt
📌 Interview Answer (short & perfect)
👉 What is tr in Linux?

You can say:

"tr is a text processing command used to translate, replace, delete, or squeeze characters from input. It works on standard input and is commonly used for case conversion and text cleanup in shell scripts."

✅ Quick Cheat Sheet
tr 'a-z' 'A-Z'    → lower → upper
tr 'A-Z' 'a-z'    → upper → lower
tr -d '0-9'       → delete digits
tr -s ' '         → remove extra spaces
tr ',' ' '        → replace comma