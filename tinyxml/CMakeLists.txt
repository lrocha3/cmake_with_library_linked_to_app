#Include the Headers
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/header)

#Include the Sources
set(SOURCES
	${CMAKE_CURRENT_SOURCE_DIR}/source/tinystr.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/source/tinyxml.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/source/tinyxmlerror.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/source/tinyxmlparser.cpp
)

add_library(TinyXMLLibrary STATIC ${SOURCES})

target_include_directories(TinyXMLLibrary INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/header)
