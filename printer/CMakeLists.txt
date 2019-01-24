#Include the Headers
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/header)

#Include the Sources
set(SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/source/printer.cpp)

add_library(PrinterLibrary STATIC ${SOURCES})

target_include_directories(PrinterLibrary INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/header)
