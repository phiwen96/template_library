cmake_minimum_required (VERSION 3.19.4)

get_filename_component (self )

project (
	template_library
	VERSION 1.0
	DESCRIPTION "Very nice project"
	LANGUAGES CXX)




file (GLOB_RECURSE HEADER_LIST ${template_library_SOURCE_DIR}/include/*.hpp)
file (GLOB_RECURSE SOURCE_LIST ${template_library_SOURCE_DIR}/src/*.cpp)

if (CMAKE_PROJECT_NAME STREQUAL PROJECT_NAME)
	set (CMAKE_CXX_STANDARD 20)
	set (CMAKE_CXX_STANDARD_REQUIRED ON)

	set_property(GLOBAL PROPERTY USE_FOLDERS YES)

	# find_package (Boost 1.75 REQUIRED)
	# find_package(Vulkan REQUIRED)
	# find_package(glfw3 REQUIRED)
	# find_package(glm REQUIRED)

	# include (CTest)
	
endif()

# add_subdirectory (generators)

add_library (phulkan_generator STATIC ${SOURCE_LIST} ${HEADER_LIST})

generate (phulkan_generator ${CMAKE_CURRENT_SOURCE_DIR}/include/phulkan_generator/instance.hpp ${CMAKE_CURRENT_SOURCE_DIR}/include/phulkan_generator/gpu.hpp)


target_include_directories (phulkan_generator PUBLIC include)
target_include_directories (phulkan_generator PRIVATE ${CMAKE_CURRENT_BINARY_DIR})



target_include_directories(phulkan_generator PRIVATE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/phulkan_generator>
    $<INSTALL_INTERFACE:include/phulkan_generator>
)

target_include_directories(phulkan_generator PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)

add_subdirectory(apps)



# cmake -S . -B xbuild -GXcode && cmake --open xbuild