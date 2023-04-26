#!/bin/bash

# Check if clang-tidy is installed
if ! command -v clang-tidy &> /dev/null
then
    # Check if OS is Ubuntu
    if [ -f /etc/lsb-release ] && grep -q "Ubuntu" /etc/lsb-release; then
        sudo apt-get update
        sudo apt-get install clang-tidy
    # Check if OS is CentOS
    elif [ -f /etc/redhat-release ] && grep -q "CentOS" /etc/redhat-release; then
        sudo yum install epel-release
        sudo yum install clang-tidy
    else
        echo "Unsupported operating system"
        exit 1
    fi
fi
