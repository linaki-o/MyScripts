# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/style/MyScripts/test

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/style/MyScripts/test

# Include any dependencies generated for this target.
include CMakeFiles/your_executable_name.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/your_executable_name.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/your_executable_name.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/your_executable_name.dir/flags.make

CMakeFiles/your_executable_name.dir/source/add.cpp.o: CMakeFiles/your_executable_name.dir/flags.make
CMakeFiles/your_executable_name.dir/source/add.cpp.o: source/add.cpp
CMakeFiles/your_executable_name.dir/source/add.cpp.o: CMakeFiles/your_executable_name.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/style/MyScripts/test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/your_executable_name.dir/source/add.cpp.o"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/your_executable_name.dir/source/add.cpp.o -MF CMakeFiles/your_executable_name.dir/source/add.cpp.o.d -o CMakeFiles/your_executable_name.dir/source/add.cpp.o -c /home/style/MyScripts/test/source/add.cpp

CMakeFiles/your_executable_name.dir/source/add.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/your_executable_name.dir/source/add.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/style/MyScripts/test/source/add.cpp > CMakeFiles/your_executable_name.dir/source/add.cpp.i

CMakeFiles/your_executable_name.dir/source/add.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/your_executable_name.dir/source/add.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/style/MyScripts/test/source/add.cpp -o CMakeFiles/your_executable_name.dir/source/add.cpp.s

# Object files for target your_executable_name
your_executable_name_OBJECTS = \
"CMakeFiles/your_executable_name.dir/source/add.cpp.o"

# External object files for target your_executable_name
your_executable_name_EXTERNAL_OBJECTS =

your_executable_name: CMakeFiles/your_executable_name.dir/source/add.cpp.o
your_executable_name: CMakeFiles/your_executable_name.dir/build.make
your_executable_name: CMakeFiles/your_executable_name.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/style/MyScripts/test/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable your_executable_name"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/your_executable_name.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/your_executable_name.dir/build: your_executable_name
.PHONY : CMakeFiles/your_executable_name.dir/build

CMakeFiles/your_executable_name.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/your_executable_name.dir/cmake_clean.cmake
.PHONY : CMakeFiles/your_executable_name.dir/clean

CMakeFiles/your_executable_name.dir/depend:
	cd /home/style/MyScripts/test && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/style/MyScripts/test /home/style/MyScripts/test /home/style/MyScripts/test /home/style/MyScripts/test /home/style/MyScripts/test/CMakeFiles/your_executable_name.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/your_executable_name.dir/depend

