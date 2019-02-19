cmake_minimum_required (VERSION 3.13.0)

project (MyProject)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -g -Wall -Wall -Wextra -Werror -O3")

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#Set the folder for the binary
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/binary)

#Main Application
add_subdirectory(application)

#Libraries
add_subdirectory(printer)
add_subdirectory(tinyxml)