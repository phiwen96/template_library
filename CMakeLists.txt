cmake_minimum_required (VERSION 3.19.4)

get_filename_component(root_src_dir src ABSOLUTE CACHE "")
get_filename_component(root_include_dir include ABSOLUTE CACHE "")
get_filename_component(root_binary_dir ${CMAKE_CURRENT_BINARY_DIR} ABSOLUTE CACHE "")
get_filename_component(root_dir ${CMAKE_CURRENT_LIST_DIR} ABSOLUTE CACHE "")

include (cmake/functions.cmake)

function(test)
    ph_parse (OPTION z VALUE o1 o2 MULTIVALUE n1 n2)
    function(z)
        
    endfunction()
    
    kiss (${ARGN})
    
endfunction()

# test (z)

ph_gen_function (OPTION ENABLE_NET COOL_STUFF VALUE TARGET2 TARGET1 MULTIVALUE SOURCES IMAGES)
# function(z1)
#     message(Z1!!!!!)
# endfunction()

bajskorven(SOURCES foo.cpp bar.cpp TARGET myApp ENABLE_NET)
message("")
bajskorven(COOL_STUFF TARGET dummy IMAGES here.png there.png gone.png)
# bajs (z1 snipp o1 kuken o2 "hej" n1 sd jn "km" n2 "l," km)


# func (SOURCES foo.cpp bar.cpp TARGET kiss SNOPP myApp ENABLE_NET)
# func (COOL_STUFF TARGET dummy IMAGES here.png there.png gone.png)

# return ()

ph_define_current_dir_name (self CACHE PUBLIC)

# return()

project (
	${self}
	VERSION 1.0
	LANGUAGES CXX C
    DESCRIPTION "Very nice project")


if (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
	set (CMAKE_CXX_STANDARD 20)
	set (CMAKE_CXX_STANDARD_REQUIRED ON)

	set_property(GLOBAL PROPERTY USE_FOLDERS YES)

	# find_package (Boost 1.75 REQUIRED)
	# find_package(Vulkan REQUIRED)
	# find_package(glfw3 REQUIRED)
	# find_package(glm REQUIRED)

	include (CTest)
	
endif()


add_subdirectory (src)
add_subdirectory (apps)

if((CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME OR MODERN_CMAKE_BUILD_TESTING)
   AND BUILD_TESTING)
  add_subdirectory(tests)
endif()















# # Set Package Name
# set(CPACK_PACKAGE_NAME "example")
# # Enable Customized Installation Directory With ON
# set(CPACK_SET_DESTDIR ON)
# # Set Installation Directory
# set(CPACK_INSTALL_PREFIX "/home/vesoft/install")
# # Set The Version Information of The Installation Package
# set(CPACK_PACKAGE_VERSION "1.0.0")
# # Set The Group Name
# set(CPACK_RPM_PACKAGE_GROUP "vesoft")
# # Set The Vendor Name
# set(CPACK_PACKAGE_VENDOR "vesoft")
# # Set The License Information
# set(CPACK_RPM_PACKAGE_LICENSE "Apache 2.0 + Common Clause 1.0")
# include(CPack)