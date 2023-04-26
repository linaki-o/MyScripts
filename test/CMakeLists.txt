cmake_minimum_required(VERSION 3.10)

project(your_project_name)

set(CMAKE_CXX_STANDARD 11)

include_directories(include)

add_executable(your_executable_name source/add.cpp)

target_include_directories(your_executable_name PRIVATE include)
