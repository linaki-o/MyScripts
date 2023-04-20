#!/bin/bash

# 检查参数是否存在
if [ -z "$1" ]
  then
    echo "需要一个参数a"
    exit 1
fi
          
# 创建文件夹并进入
mkdir "$1"
cd "$1"

# 创建所需的文件夹
mkdir bin
mkdir doc
mkdir demo
mkdir include
mkdir lib

# 创建readme.md文件
touch readme.md
