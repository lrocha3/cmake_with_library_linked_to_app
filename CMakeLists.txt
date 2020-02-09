cmake_minimum_required (VERSION 3.10.2)

project (Project)

option(CodeCoverage "CodeCoverage" OFF)

if (CodeCoverage MATCHES ON)
	set(COVERAGE_FLAGS "-g -O0 --coverage -fprofile-arcs -ftest-coverage")
	set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/modules/)
else()
	set(COVERAGE_FLAGS "")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${COVERAGE_FLAGS} -Wno-deprecated-register -Wall -Wextra -Werror")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${COVERAGE_FLAGS} -Wno-deprecated-register -Wall -Wextra -Werror")

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

#Set the folder for the binary
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/binary)

#Main Application
add_subdirectory(application)

#Libraries
add_subdirectory(printer)
add_subdirectory(tinyxml)

#Coverage
if (CodeCoverage MATCHES ON)
	add_subdirectory(tests)
	include(CodeCoverage)

	COVERAGE_TARGET(${PROJECT_NAME}_coverage UnitTests coverage)
endif()



