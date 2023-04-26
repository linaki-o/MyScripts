#!/bin/bash

# Set color variables
BRED='\033[1;31m' # Bold
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'
NC='\033[0m' # No Color
check() {
    # Check if argument is a directory
    if [ -d "$1" ]; then
        # Print all files in directory
        for file in "$1"/*; do
            check $file
        done
    # Check if argument is a file
    elif [ -f "$1" ]; then
        # Print file name
        echo -e "${BRED}[CHECK FILE]: $1${NC}"
        clang-tidy "$1" --config-file='work_code_config_file'
    else
        echo "Invalid argument"
    fi
}
check $1
