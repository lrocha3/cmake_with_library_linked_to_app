# Make sure you have installed the needed software:
# Lcov:
# sudo apt install lcov
#
# Google Tests:
# sudo apt-get install libgtest-dev
# cd /usr/src/gtest
# sudo cmake CMakeLists.txt
# sudo make
# sudo cp *.a /usr/lib


#Try to find all programs needed
FIND_PROGRAM( GCOV_PATH gcov )
FIND_PROGRAM( LCOV_PATH lcov )
FIND_PROGRAM( GENHTML_PATH genhtml )

IF(NOT GCOV_PATH)
	MESSAGE(FATAL_ERROR "gcov not found! Aborting...")
ENDIF()

IF(NOT LCOV_PATH)
	MESSAGE(FATAL_ERROR "lcov not found! Aborting...")
ENDIF()

IF(NOT GENHTML_PATH)
	MESSAGE(FATAL_ERROR "genhtml not found! Aborting...")
ENDIF() # NOT GENHTML_PATH

# Param TARGET_NAME     Custom make target for coverage
# Param TEST_RUNNER     Name of the target which runs the tests
# Param OUTPUT_NAME     lcov will output the ${OUTPUT_NAME}.info
#                       HTML report is generated in ${OUTPUT_NAME}/index.html
FUNCTION(COVERAGE_TARGET TARGET_NAME TEST_RUNNER OUTPUT_NAME)

	# Setup a new target
	ADD_CUSTOM_TARGET(${TARGET_NAME}
		
		# Cleanup lcov
		${LCOV_PATH} --directory . --zerocounters
		
		# Run tests
		COMMAND ${TEST_RUNNER} ${ARGV3}

		MESSAGE 
		# Capturing lcov counters and generating report
		COMMAND ${LCOV_PATH} --directory . --capture  --output-file ${OUTPUT_NAME}.info
		COMMAND ${LCOV_PATH} --remove ${OUTPUT_NAME}.info '*tests/*' '/usr/*' --output-file ${OUTPUT_NAME}_filteted.info
		COMMAND mv ${OUTPUT_NAME}_filteted.info ${OUTPUT_NAME}.info
		COMMAND ${GENHTML_PATH} -o ${OUTPUT_NAME} ${OUTPUT_NAME}.info
		COMMAND ${CMAKE_COMMAND} -E remove ${OUTPUT_NAME}.info
		
		COMMENT "Resetting code coverage counters to zero"
		COMMENT "Processing code coverage counters and generating report."
	)
	
	# Show info where to find the report
	ADD_CUSTOM_COMMAND(TARGET ${TARGET_NAME} POST_BUILD
		COMMAND ;
		COMMENT "Report can be found in ./${OUTPUT_NAME}/index.html"
	)

ENDFUNCTION()