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

CMakeFiles/Mymuduo.dir/Acceptor.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/Acceptor.cpp.o: ../Acceptor.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/Mymuduo.dir/Acceptor.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/Acceptor.cpp.o -c /home/node1/coding/muduo/Acceptor.cpp

CMakeFiles/Mymuduo.dir/Acceptor.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/Acceptor.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/Acceptor.cpp > CMakeFiles/Mymuduo.dir/Acceptor.cpp.i

CMakeFiles/Mymuduo.dir/Acceptor.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/Acceptor.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/Acceptor.cpp -o CMakeFiles/Mymuduo.dir/Acceptor.cpp.s

CMakeFiles/Mymuduo.dir/Buffer.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/Buffer.cpp.o: ../Buffer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/Mymuduo.dir/Buffer.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/Buffer.cpp.o -c /home/node1/coding/muduo/Buffer.cpp

CMakeFiles/Mymuduo.dir/Buffer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/Buffer.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/Buffer.cpp > CMakeFiles/Mymuduo.dir/Buffer.cpp.i

CMakeFiles/Mymuduo.dir/Buffer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/Buffer.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/Buffer.cpp -o CMakeFiles/Mymuduo.dir/Buffer.cpp.s

CMakeFiles/Mymuduo.dir/Channel.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/Channel.cpp.o: ../Channel.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/Mymuduo.dir/Channel.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/Channel.cpp.o -c /home/node1/coding/muduo/Channel.cpp

CMakeFiles/Mymuduo.dir/Channel.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/Channel.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/Channel.cpp > CMakeFiles/Mymuduo.dir/Channel.cpp.i

CMakeFiles/Mymuduo.dir/Channel.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/Channel.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/Channel.cpp -o CMakeFiles/Mymuduo.dir/Channel.cpp.s

CMakeFiles/Mymuduo.dir/CurrentThread.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/CurrentThread.cpp.o: ../CurrentThread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/Mymuduo.dir/CurrentThread.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/CurrentThread.cpp.o -c /home/node1/coding/muduo/CurrentThread.cpp

CMakeFiles/Mymuduo.dir/CurrentThread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/CurrentThread.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/CurrentThread.cpp > CMakeFiles/Mymuduo.dir/CurrentThread.cpp.i

CMakeFiles/Mymuduo.dir/CurrentThread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/CurrentThread.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/CurrentThread.cpp -o CMakeFiles/Mymuduo.dir/CurrentThread.cpp.s

CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.o: ../DefaultPoller.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.o -c /home/node1/coding/muduo/DefaultPoller.cpp

CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/DefaultPoller.cpp > CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.i

CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/DefaultPoller.cpp -o CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.s

CMakeFiles/Mymuduo.dir/EPollPoller.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/EPollPoller.cpp.o: ../EPollPoller.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building CXX object CMakeFiles/Mymuduo.dir/EPollPoller.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/EPollPoller.cpp.o -c /home/node1/coding/muduo/EPollPoller.cpp

CMakeFiles/Mymuduo.dir/EPollPoller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/EPollPoller.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/EPollPoller.cpp > CMakeFiles/Mymuduo.dir/EPollPoller.cpp.i

CMakeFiles/Mymuduo.dir/EPollPoller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/EPollPoller.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/EPollPoller.cpp -o CMakeFiles/Mymuduo.dir/EPollPoller.cpp.s

CMakeFiles/Mymuduo.dir/EventLoop.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/EventLoop.cpp.o: ../EventLoop.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building CXX object CMakeFiles/Mymuduo.dir/EventLoop.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/EventLoop.cpp.o -c /home/node1/coding/muduo/EventLoop.cpp

CMakeFiles/Mymuduo.dir/EventLoop.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/EventLoop.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/EventLoop.cpp > CMakeFiles/Mymuduo.dir/EventLoop.cpp.i

CMakeFiles/Mymuduo.dir/EventLoop.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/EventLoop.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/EventLoop.cpp -o CMakeFiles/Mymuduo.dir/EventLoop.cpp.s

CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.o: ../EventLoopThread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building CXX object CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.o -c /home/node1/coding/muduo/EventLoopThread.cpp

CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/EventLoopThread.cpp > CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.i

CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/EventLoopThread.cpp -o CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.s

CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.o: ../EventLoopThreadPool.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building CXX object CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.o -c /home/node1/coding/muduo/EventLoopThreadPool.cpp

CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/EventLoopThreadPool.cpp > CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.i

CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/EventLoopThreadPool.cpp -o CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.s

CMakeFiles/Mymuduo.dir/InetAddress.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/InetAddress.cpp.o: ../InetAddress.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building CXX object CMakeFiles/Mymuduo.dir/InetAddress.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/InetAddress.cpp.o -c /home/node1/coding/muduo/InetAddress.cpp

CMakeFiles/Mymuduo.dir/InetAddress.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/InetAddress.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/InetAddress.cpp > CMakeFiles/Mymuduo.dir/InetAddress.cpp.i

CMakeFiles/Mymuduo.dir/InetAddress.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/InetAddress.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/InetAddress.cpp -o CMakeFiles/Mymuduo.dir/InetAddress.cpp.s

CMakeFiles/Mymuduo.dir/Logger.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/Logger.cpp.o: ../Logger.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building CXX object CMakeFiles/Mymuduo.dir/Logger.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/Logger.cpp.o -c /home/node1/coding/muduo/Logger.cpp

CMakeFiles/Mymuduo.dir/Logger.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/Logger.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/Logger.cpp > CMakeFiles/Mymuduo.dir/Logger.cpp.i

CMakeFiles/Mymuduo.dir/Logger.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/Logger.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/Logger.cpp -o CMakeFiles/Mymuduo.dir/Logger.cpp.s

CMakeFiles/Mymuduo.dir/Poller.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/Poller.cpp.o: ../Poller.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building CXX object CMakeFiles/Mymuduo.dir/Poller.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/Poller.cpp.o -c /home/node1/coding/muduo/Poller.cpp

CMakeFiles/Mymuduo.dir/Poller.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/Poller.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/Poller.cpp > CMakeFiles/Mymuduo.dir/Poller.cpp.i

CMakeFiles/Mymuduo.dir/Poller.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/Poller.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/Poller.cpp -o CMakeFiles/Mymuduo.dir/Poller.cpp.s

CMakeFiles/Mymuduo.dir/Socket.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/Socket.cpp.o: ../Socket.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building CXX object CMakeFiles/Mymuduo.dir/Socket.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/Socket.cpp.o -c /home/node1/coding/muduo/Socket.cpp

CMakeFiles/Mymuduo.dir/Socket.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/Socket.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/Socket.cpp > CMakeFiles/Mymuduo.dir/Socket.cpp.i

CMakeFiles/Mymuduo.dir/Socket.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/Socket.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/Socket.cpp -o CMakeFiles/Mymuduo.dir/Socket.cpp.s

CMakeFiles/Mymuduo.dir/TcpConnection.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/TcpConnection.cpp.o: ../TcpConnection.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building CXX object CMakeFiles/Mymuduo.dir/TcpConnection.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/TcpConnection.cpp.o -c /home/node1/coding/muduo/TcpConnection.cpp

CMakeFiles/Mymuduo.dir/TcpConnection.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/TcpConnection.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/TcpConnection.cpp > CMakeFiles/Mymuduo.dir/TcpConnection.cpp.i

CMakeFiles/Mymuduo.dir/TcpConnection.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/TcpConnection.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/TcpConnection.cpp -o CMakeFiles/Mymuduo.dir/TcpConnection.cpp.s

CMakeFiles/Mymuduo.dir/Tcpserver.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/Tcpserver.cpp.o: ../Tcpserver.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building CXX object CMakeFiles/Mymuduo.dir/Tcpserver.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/Tcpserver.cpp.o -c /home/node1/coding/muduo/Tcpserver.cpp

CMakeFiles/Mymuduo.dir/Tcpserver.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/Tcpserver.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/Tcpserver.cpp > CMakeFiles/Mymuduo.dir/Tcpserver.cpp.i

CMakeFiles/Mymuduo.dir/Tcpserver.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/Tcpserver.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/Tcpserver.cpp -o CMakeFiles/Mymuduo.dir/Tcpserver.cpp.s

CMakeFiles/Mymuduo.dir/Thread.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/Thread.cpp.o: ../Thread.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building CXX object CMakeFiles/Mymuduo.dir/Thread.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/Thread.cpp.o -c /home/node1/coding/muduo/Thread.cpp

CMakeFiles/Mymuduo.dir/Thread.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/Thread.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/Thread.cpp > CMakeFiles/Mymuduo.dir/Thread.cpp.i

CMakeFiles/Mymuduo.dir/Thread.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/Thread.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/Thread.cpp -o CMakeFiles/Mymuduo.dir/Thread.cpp.s

CMakeFiles/Mymuduo.dir/Timestamp.cpp.o: CMakeFiles/Mymuduo.dir/flags.make
CMakeFiles/Mymuduo.dir/Timestamp.cpp.o: ../Timestamp.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building CXX object CMakeFiles/Mymuduo.dir/Timestamp.cpp.o"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/Mymuduo.dir/Timestamp.cpp.o -c /home/node1/coding/muduo/Timestamp.cpp

CMakeFiles/Mymuduo.dir/Timestamp.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/Mymuduo.dir/Timestamp.cpp.i"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/node1/coding/muduo/Timestamp.cpp > CMakeFiles/Mymuduo.dir/Timestamp.cpp.i

CMakeFiles/Mymuduo.dir/Timestamp.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/Mymuduo.dir/Timestamp.cpp.s"
	/usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/node1/coding/muduo/Timestamp.cpp -o CMakeFiles/Mymuduo.dir/Timestamp.cpp.s

# Object files for target Mymuduo
Mymuduo_OBJECTS = \
"CMakeFiles/Mymuduo.dir/Acceptor.cpp.o" \
"CMakeFiles/Mymuduo.dir/Buffer.cpp.o" \
"CMakeFiles/Mymuduo.dir/Channel.cpp.o" \
"CMakeFiles/Mymuduo.dir/CurrentThread.cpp.o" \
"CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.o" \
"CMakeFiles/Mymuduo.dir/EPollPoller.cpp.o" \
"CMakeFiles/Mymuduo.dir/EventLoop.cpp.o" \
"CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.o" \
"CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.o" \
"CMakeFiles/Mymuduo.dir/InetAddress.cpp.o" \
"CMakeFiles/Mymuduo.dir/Logger.cpp.o" \
"CMakeFiles/Mymuduo.dir/Poller.cpp.o" \
"CMakeFiles/Mymuduo.dir/Socket.cpp.o" \
"CMakeFiles/Mymuduo.dir/TcpConnection.cpp.o" \
"CMakeFiles/Mymuduo.dir/Tcpserver.cpp.o" \
"CMakeFiles/Mymuduo.dir/Thread.cpp.o" \
"CMakeFiles/Mymuduo.dir/Timestamp.cpp.o"

# External object files for target Mymuduo
Mymuduo_EXTERNAL_OBJECTS =

../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/Acceptor.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/Buffer.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/Channel.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/CurrentThread.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/DefaultPoller.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/EPollPoller.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/EventLoop.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/EventLoopThread.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/EventLoopThreadPool.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/InetAddress.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/Logger.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/Poller.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/Socket.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/TcpConnection.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/Tcpserver.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/Thread.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/Timestamp.cpp.o
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/build.make
../lib/libMymuduo.so: CMakeFiles/Mymuduo.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/node1/coding/muduo/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Linking CXX shared library ../lib/libMymuduo.so"
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

