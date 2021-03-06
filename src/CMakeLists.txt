
# ph_current_dir_name (self)

file (GLOB_RECURSE HEADER_LIST ${${CMAKE_PROJECT_NAME}_SOURCE_DIR}/include/*.hpp)
file (GLOB_RECURSE SOURCE_LIST ${${CMAKE_PROJECT_NAME}_SOURCE_DIR}/src/*.cpp)

# file(GLOB_RECURSE HEADER_LIST "${phulkan_SOURCE_DIR}/include/phulkan/*.hpp")
# file(GLOB SOURCE_LIST ${phulkan_SOURCE_DIR}/src/*.cpp)

# add_subdirectory (generators)

add_library (${CMAKE_PROJECT_NAME} STATIC ${SOURCE_LIST} ${HEADER_LIST})

# generate (phulkan_generator ${CMAKE_CURRENT_SOURCE_DIR}/include/phulkan_generator/instance.hpp ${CMAKE_CURRENT_SOURCE_DIR}/include/phulkan_generator/gpu.hpp)


target_include_directories (${CMAKE_PROJECT_NAME} PUBLIC include)
target_include_directories (${CMAKE_PROJECT_NAME} PRIVATE ${CMAKE_CURRENT_BINARY_DIR})



target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include/${CMAKE_PROJECT_NAME}>
    $<INSTALL_INTERFACE:include/phulkan_generator>
)

target_include_directories(${CMAKE_PROJECT_NAME} PUBLIC
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    $<INSTALL_INTERFACE:include>
)




# cmake -S . -B xbuild -GXcode && cmake --open xbuild





set_target_properties (${CMAKE_PROJECT_NAME} PROPERTIES
    OUTPUT_NAME ${CMAKE_PROJECT_NAME}
    MACOSX_BUNDLE TRUE
    MACOSX_RPATH TRUE
    MACOSX_FRAMEWORK_IDENTIFIER com.testcmake.bundlename
    XCODE_ATTRIBUTE_LD_RUNPATH_SEARCH_PATHS "@loader_path/Libraries"
    RESOURCE "${RESOURCE_FILES}"
    XCODE_ATTRIBUTE_ENABLE_HARDENED_RUNTIME TRUE
    XCODE_ATTRIBUTE_EXECUTABLE_NAME "exeName"
)