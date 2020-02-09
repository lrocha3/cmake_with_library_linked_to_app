cmake_minimum_required(VERSION 2.8)
project(UnitTests)

find_package(GTest REQUIRED)
find_package (Threads REQUIRED)

include_directories(${GTEST_INCLUDE_DIRS})

#Add the test files to the test_sources
set(test_sources printer_test.cpp)

add_executable(${PROJECT_NAME} ${test_sources})
target_link_libraries(${PROJECT_NAME} gtest_main PrinterLibrary ${GTEST_LIBRARIES} ${CMAKE_THREAD_LIBS_INIT})

