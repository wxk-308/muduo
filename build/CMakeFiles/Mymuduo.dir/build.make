# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
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
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/node1/coding/muduo

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/node1/coding/muduo/build

# Include any dependencies generated for this target.
include CMakeFiles/Mymuduo.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/Mymuduo.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/Mymuduo.dir/flags.make

CMakeFiles/Mymuduo.dir/Logger.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/Logger.cpp.o: ../Logger.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Mymuduo.dir/Logger.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/Logger.cpp.o -c /home/node1/coding/muduo/Logger.cpp

CMakeFiles/Mymuduo.dir/Logger.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/Logger.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/Logger.cpp > CMakeFiles/Mymuduo.dir/Logger.cpp.i

CMakeFiles/Mymuduo.dir/Logger.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/Logger.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/Logger.cpp -o CMakeFiles/Mymuduo.dir/Logger.cpp.s

CMakeFiles/Mymuduo.dir/Timestamp.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/Timestamp.cpp.o: ../Timestamp.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Mymuduo.dir/Timestamp.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/Timestamp.cpp.o -c /home/node1/coding/muduo/Timestamp.cpp

CMakeFiles/Mymuduo.dir/Timestamp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/Timestamp.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/Timestamp.cpp > CMakeFiles/Mymuduo.dir/Timestamp.cpp.i

CMakeFiles/Mymuduo.dir/Timestamp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/Timestamp.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/Timestamp.cpp -o CMakeFiles/Mymuduo.dir/Timestamp.cpp.s

# Object files for target Mymuduo
Mymuduo_OBJECTS = \
"CMakeFiles/Mymuduo.dir/Logger.cpp.o" \
"CMakeFiles/Mymuduo.dir/Timestamp.cpp.o"

# External object files for target Mymuduo
Mymuduo_EXTERNAL_OBJECTS =

../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/Logger.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/Timestamp.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/build.make
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking CXX shared library ../lib/libMymuduo.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/Mymuduo.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/Mymuduo.dir/build: ../lib/libMymuduo.so

.PHONY : CMakeFiles/Mymuduo.dir/build

CMakeFiles/Mymuduo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/Mymuduo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/Mymuduo.dir/clean

CMakeFiles/Mymuduo.dir/depend:
	cd /home/node1/coding/muduo/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/node1/coding/muduo /home/node1/coding/muduo /home/node1/coding/muduo/build /home/node1/coding/muduo/build /home/node1/coding/muduo/build/CMakeFiles/Mymuduo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/Mymuduo.dir/depend
