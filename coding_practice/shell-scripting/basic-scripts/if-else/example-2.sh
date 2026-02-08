#!/bin/bash


# Taking user inputs
read -p "Enter your role: " role

# Converting text inputs
role=$(echo $role | tr '[:upper:]' '[:lower:'])
# matching with condition
if [[ $role == "devops" ]]
then
    echo "Welcome Devops Engineer, Access has been granted!"
else
    echo "Access denied!"
fi



# Output

# Enter your role: devops
# Welcome Devops Engineer, Access has been granted!

# Enter your role: Devops
# Access denied!

# Enter your role: devOPS
# Welcome Devops Engineer, Access has been granted!