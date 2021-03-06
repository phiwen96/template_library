cmake_minimum_required (VERSION 3.19.4)
include(CMakeParseArguments)

macro (ph_gen_function)
    # set(prefix       ARG_)
    set(options    )
    set(oneValueArgs)
    set(multiValueArgs OPTION VALUE MULTIVALUE)

    # message(${multiValueArgs})
    cmake_parse_arguments(KUK "${options}" "${oneValueArgs}" "${multiValueArgs}" "${ARGN}") 

    
    # Mandatory
    if( KUK_OPTION )
        # message( STATUS "inside OPTION=${KUK_OPTION}" )
        set (options ${KUK_OPTION})
        message( STATUS "${options}" )
    endif()

    if( KUK_VALUE )
        # message( STATUS "inside OPTION=${KUK_VALUE}" )
        set (oneValueArgs ${KUK_VALUE})
        message( STATUS "${oneValueArgs}" )
    endif()

    if( KUK_MULTIVALUE )
        # message( STATUS "inside OPTION=${KUK_MULTIVALUE}" )
        set (multiValueArgs ${KUK_MULTIVALUE})
        message( STATUS "${multiValueArgs}" )
    endif()

    # message(${options})
    # string (REPLACE ";" " " options "${options}")
    # string (REPLACE ";" " " multiValueArgs ${multiValueArgs})
    #         string(REPLACE " " ";" oneValueArgs "${oneValueArgs}")

    #         message(${options})
    #         message(${oneValueArgs})
    #         message(${multiValueArgs})

    macro (bajskorven)
        # message (${ARGN})
        # set(prefix       ARG_)
    # set(options     ${options})
    # set(oneValueArgs ${oneValueArgs})
    # set(multiValueArgs  ${multiValueArgs})
    # message(${option})


    message("${SOURCES}")

        cmake_parse_arguments( _arg  "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN}) 

        
        message("${options}")

        message("${SOURCES}")

    foreach(arg ${options})
        message(${arg})
        if(${arg} IN_LIST _arg_KEYWORDS_MISSING_${arg})
            message(STATUS "${arg}: missed value")
        elseif(NOT DEFINED _arg_${arg})
            message(STATUS "${arg}: undefined")
        else()
            message(STATUS "${arg}: got the value `${_arg_${arg}}`")
        endif()
    endforeach()

    foreach(arg ${oneValueArgs})
        # message(${arg})
        if(${arg} IN_LIST _arg_KEYWORDS_MISSING_${arg})
            message(STATUS "${arg}: missed value")
        elseif(NOT DEFINED _arg_${arg})
            message(STATUS "${arg}: undefined")
        else()
            message(STATUS "${arg}: got the value `${_arg_${arg}}`")
        endif()
    endforeach()

    foreach(arg ${multiValueArgs})
        # message(${arg})
        if(${arg} IN_LIST _arg_KEYWORDS_MISSING_${arg})
            message(STATUS "${arg}: missed value")
        # elseif(NOT DEFINED _arg_${arg})
            # message(STATUS "${arg}: undefined")
        else()
            foreach(arg2 ${arg})
                message(${arg2})
            endforeach()
            
            # message(STATUS "${arg}: got the value `${_arg_${arg}}`")
        endif()
    endforeach()
    
        

        # foreach(arg IN ITEMS ${ARGN})
        #     message(STATUS "\n ARG : ${arg} \n")
        # endforeach()

        foreach(arg IN ITEMS ${options2})
            # message(STATUS "\n ARG : FITTA_${arg} \n")
        endforeach()

        # foreach(arg IN ITEMS ARGN)
        # message("hej")
        #     message(STATUS "\n ARG : ${arg} \n")
        # endforeach()
        

        # message(options2)
        foreach(arg IN LISTS options)
            # message(${${prefix}_${arg}})
            if(${${prefix}_${arg}})
            # message("  ${arg} = ${${prefix}_${arg}}")
            #   message("  ${arg} enabled")
          else()
            #   message("  ${arg} disabled")
          endif()
        endforeach()

        # message(oneValueArgs2)
        foreach(arg IN LISTS oneValueArgs)
        # message("  ${arg} = ${FITTA_${arg}}")
        # message(${arg})
            # message("${${prefix}_${arg}}")
            # message("${arg}")
            # cmake_language(CALL ${arg} ${${prefix}_${arg}})
            # Single argument values will print as a simple string
            # Multiple argument values will print as a list
            # message("  ${arg} = ${${prefix}_${arg}}")
        endforeach()

        # message(multiValueArgs2)
        foreach(arg IN LISTS  multiValueArgs)
        # get_filename_component (kk "${${prefix}_${arg}}" NAME)
        # message("${kk}")
        # message("${${prefix}_${arg}}")
        # message(${arg})
        # message("${arg}")
        # message("${${prefix}_MULTIVALUE}")
        # message(${prefix}_${arg})
        # message("${${prefix}_${arg}}")
          
            
            # message("${${prefix}_${arg}}")
            # message("  ${arg} = ${${prefix}_${arg}}")
        endforeach()


        

        

        

        foreach(arg IN LISTS ${multiValues_r})
        # message("  ${arg} = ${${prefix}_${arg}}")
            # Single argument values will print as a simple string
            # Multiple argument values will print as a list
            # message("  ${arg} = ${${prefix}_${arg}}")
        endforeach()

    endmacro()
    
endmacro ()












macro (ph_parse function_name)
    # Define the supported set of keywords
    set(prefix       ARG)
    set(noValues     ARGS_0)
    set(singleValues ARGS_1)
    set(multiValues  ARGS_N)

    cmake_parse_arguments(${prefix}
                        "${noValues}"
                        "${singleValues}"
                        "${multiValues}"
                        ${ARGN}
    )

    foreach(arg IN LISTS noValues)
        if(${${prefix}_${arg}})
            list (APPEND prefix_r ${arg})
            # message("  ${arg} enabled")
        else()
            # message("  ${arg} disabled")
        endif()
    endforeach()
    foreach(arg IN LISTS singleValues)
        list (APPEND singleValues_r ${${prefix}_${arg}})
        # message("  ${arg} = ${${prefix}_${arg}}")
    endforeach()
    foreach(arg IN LISTS multiValues)
        list (APPEND multiValues_r ${${prefix}_${arg}})
        # message("  ${arg} = ${${prefix}_${arg}}")
    endforeach()
    
    set(message_command "message")
    cmake_language(CALL ${message_command} STATUS "Hello World!")

    cmake_parse_arguments(${prefix}
                        "${noValues_r}"
                        "${singleValues_r}"
                        "${multiValues_r}"
                        ${ARGN}
    )

    function (kiss)
    foreach(arg IN LISTS noValues_r)
        if(${${prefix}_${arg}})
                
            message("  ${arg} enabled")
        else()
            message("  ${arg} disabled")
        endif()
    endforeach()
    foreach(arg IN LISTS singleValues_r)
        cmake_language(CALL ${arg} ${${prefix}_${arg}})
        # Single argument values will print as a simple string
        # Multiple argument values will print as a list
        message("  ${arg} = ${${prefix}_${arg}}")
    endforeach()
    foreach(arg IN LISTS multiValues_r)
        # Single argument values will print as a simple string
        # Multiple argument values will print as a list
        message("  ${arg} = ${${prefix}_${arg}}")
    endforeach()
    endfunction()


endmacro ()




macro (ph_define_self res)
    set (options PUBLIC)
    cmake_parse_arguments (KUK "${options}" "" "" ${ARGN})
    if (KUK_PUBLIC)
        message("PUBLIC!!!!")

    endif ()
    get_filename_component (${res} ${CMAKE_CURRENT_LIST_DIR} NAME ${ARGN})
    string(REPLACE " " "_" res ${res})
endmacro ()



function (ph_parent_dir current_dir ret)
    cmake_path (HAS_PARENT_PATH ${current_dir} has_parent)
    if (${has_parent})
        cmake_path (GET ${current_dir} PARENT_PATH ${ret})
    endif ()
endfunction ()


function(add_mytest targetName)
      add_executable(${targetName} ${ARGN})
      target_link_libraries(${targetName} PRIVATE foobar)
      add_test(NAME    ${targetName}
               COMMAND ${targetName}
      )
endfunction()




function (func)
    # Define the supported set of keywords
    set(prefix       ARG)
    set(noValues     ENABLE_NET COOL_STUFF SNOPP)
    set(singleValues TARGET)
    set(multiValues  SOURCES IMAGES)
    # Process the arguments passed in
    include(CMakeParseArguments)
    cmake_parse_arguments(${prefix}
                        "${noValues}"
                        "${singleValues}"
                        "${multiValues}"
                        ${ARGN})
    # Log details for each supported keyword
    message("Option summary:")
    foreach(arg IN LISTS noValues)
        if(${${prefix}_${arg}})
            # if (${arg} EQUAL SNOPP)
            #     message(SNOPP!!!!!!)
            # endif()
            message("  ${arg} enabled")
            # message ("prefix = ${prefix} arg = ${arg}")
        else()
            message("  ${arg} disabled")
        endif()
    endforeach()
    foreach(arg IN LISTS singleValues multiValues)
        # Single argument values will print as a simple string
        # Multiple argument values will print as a list
        message("  ${arg} = ${${prefix}_${arg}}")
        # message ("prefix = ${prefix} arg = ${arg}")
    endforeach()
endfunction()
    





function(ph_define_list_len list res)
    list(LENGTH ${list} ${res})
endfunction()

# set(SEXY_STRING "I love CMake")
# string(REPLACE " " ";" SEXY_LIST ${SEXY_STRING})

# message(STATUS "string = ${SEXY_STRING}")
# # string = I love CMake

# message(STATUS "list = ${SEXY_LIST}")
# # list = I;love;CMake



# message ("number of arguments sent to function: ${ARGC}")
#   message ("all function arguments:               ${ARGV}")
#   message ("all arguments beyond defined:         ${ARGN}") 



macro(ph_get_property ret var)
get_property(${ret} GLOBAL PROPERTY ${var})
endmacro()

macro(ph_define_property res var)
    set_property (GLOBAL PROPERTY ${res} ${var})
endmacro()



macro (ph_header_list return_list)
    if (${ARGN} EQUALS 1)
        file (GLOB_RECURSE new_list ${ARGN}/*.hpp)
    elseif()
        file (GLOB_RECURSE new_list *.h)
    endif()
    file (GLOB_RECURSE new_list *.h)
    set (dir_list "")
    foreach (file_path ${new_list})
        get_filename_component (dir_path ${file_path} PATH)
        set (dir_list ${dir_list} ${dir_path})
    endforeach ()
    list (REMOVE_DUPLICATES dir_list)
    set (${return_list} ${dir_list})
endmacro ()





# reading files

# # Assuming the canonical version is listed in a single line
# # This would be in several parts if picking up from MAJOR, MINOR, etc.
# set(VERSION_REGEX "#define MY_VERSION[ \t]+\"(.+)\"")

# # Read in the line containing the version
# file(STRINGS "${CMAKE_CURRENT_SOURCE_DIR}/include/My/Version.hpp"
#     VERSION_STRING REGEX ${VERSION_REGEX})

# # Pick out just the version
# string(REGEX REPLACE ${VERSION_REGEX} "\\1" VERSION_STRING "${VERSION_STRING}")

# # Automatically getting PROJECT_VERSION_MAJOR, My_VERSION_MAJOR, etc.
# project(My LANGUAGES CXX VERSION ${VERSION_STRING})



function(COMPLEX) 
    cmake_parse_arguments(
        COMPLEX_PREFIX
        "SINGLE;ANOTHER" "ONE_VALUE;ALSO_ONE_VALUE" "MULTI_VALUES"
        ${ARGN}
    ) 
endfunction()



macro(ph_dont_build_here)
set(CMAKE_DISABLE_SOURCE_CHANGES ON)
set(CMAKE_DISABLE_IN_SOURCE_BUILD ON)s
    file (TO_CMAKE_PATH "${PROJECT_BINARY_DIR}/CMakeLists.txt" LOC_PATH)
    if (EXISTS "${LOC_PATH}")
        message (FATAL_ERROR "You cannot build in a source directory.")
    endif ()
endmacro()
