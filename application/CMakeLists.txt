#Include the Headers
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/header)

#Include the Sources
set(SOURCES
	${CMAKE_CURRENT_SOURCE_DIR}/source/main.cpp
	${CMAKE_CURRENT_SOURCE_DIR}/source/XmlWrapper.cpp
)

add_executable (MyApplication ${SOURCES})

#Link the libraries to the application
target_link_libraries(MyApplication PrinterLibrary TinyXMLLibrary)