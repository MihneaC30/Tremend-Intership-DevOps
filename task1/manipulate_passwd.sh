#!/bin/bash

# Function to check privileges
check_privileges() {
    if [ "$(id -u)" -ne 0 ]; then
        echo "Error: This script must be executed with root privileges."
        exit 1
    fi
}

# Function to print home directory
print_home_directory() {
    echo "Home Directory: $(getent passwd | cut -d: -f6)"
}

# Function to list all usernames
list_usernames() {
    echo "Usernames:"
    cut -d: -f1 /etc/passwd
}

# Function to count number of users
count_users() {
    echo "Number of users: $(cut -d: -f1 /etc/passwd | wc -l)"
}

# Function to find home directory of specific user
find_user_home() {
    read -p "Enter username: " username
    echo "Home Directory of $username: $(getent passwd "$username" | cut -d: -f6)"
}

# Function to list users with specific UID range
list_users_uid_range() {
    echo "Users with UID Range 1000-1010:"
    awk -F: '{ if ($3 >= 1000 && $3 <= 1010) print $1 }' /etc/passwd
}

# Function to find users with standard shells
find_standard_shells() {
    echo "Users with Standard Shells (/bin/bash or /bin/sh):"
    grep -E '/bin/(bash|sh)$' /etc/passwd | cut -d: -f1
}

# Function to replace '/' with '\' in passwd file
replace_slash() {
    sed 's/\//\\/g' /etc/passwd > /etc/passwd_new
    echo "Content with '/' replaced with '\':"
    cat /etc/passwd_new
}

# Function to print private IP
print_private_ip() {
    echo "Private IP: $(hostname -I)"
}

# Function to print public IP
print_public_ip() {
    echo "Public IP: $(curl -s ifconfig.me)"
}

switch_to_john() {
    echo "Switching to 'john' user:"
    su - john -c 'echo "Home Directory of john: $HOME"'
}


# Main function
main() {
    check_privileges
    print_home_directory
    list_usernames
    count_users
    find_user_home
    list_users_uid_range
    find_standard_shells
    replace_slash
    print_private_ip
    print_public_ip
    switch_to_john
}

# Execute main function
main
