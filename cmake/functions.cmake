cmake_minimum_required (VERSION 3.19.4)
include(CMakeParseArguments)

macro (ph_gen_function)
    set(prefix       ARG_)
    set(options     )
    set(oneValueArgs )
    set(multiValueArgs  OPTION VALUE MULTIVALUE)

    # message(${multiValueArgs})
    cmake_parse_arguments("${prefix}" "${options}" "${oneValueArgs}" "${multiValueArgs}" "${ARGN}") 

    # message("${${prefix}_UNPARSED_ARGUMENTS}")
    # message("${${prefix}_OPTION}")
    # message("${${prefix}_VALUE}")
    # message("${${prefix}_MULTIVALUE}")
    foreach(arg IN LISTS multiValueArgs)
        foreach(arg2 ${arg})
            # message("${arg} ${arg2}")
        endforeach()
        
        # if(${${prefix}_${arg}})
        #     # list (APPEND prefix_r ${arg})
        #     # message("  ${arg} enabled")
        # else()
        #     # message("  ${arg} disabled")
        # endif()
    endforeach()
    foreach(arg IN LISTS singleValues)
        # list (APPEND singleValues_r ${${prefix}_${arg}})
        # message("  ${arg} = ${${prefix}_${arg}}")
    endforeach()
    foreach(arg IN LISTS multiValueArgs)
        
        # if (${${prefix}_${arg}} STREQUAL ARGS_0)
            foreach(arg2 ${${prefix}_${arg}})
                if (${arg} STREQUAL OPTION)
                    set (${options} ${options} ${arg2})
                    message("OPTION ${arg2}")
                    # set (noValues_r ${noValues_r} ${arg2})
                elseif (${arg} STREQUAL VALUE)
                    set (${oneValueArgs} ${oneValueArgs} ${arg2})
                    # message("VALUE ${arg2}")
                    # set (singleValues_r ${singleValues_r} ${arg2})
                elseif (${arg} STREQUAL MULTIVALUE)
                    # message("MULTIVALUE ${arg2}")
                
                    set (${multiValueArgs} ${multiValueArgs} ${arg2})
                    # set (multiValues_r ${multiValues_r} ${arg2})
                endif ()
                # message("${arg} ${arg2}")
                # message()
            endforeach()
            
            # message("  ${arg} = ${${prefix}_${arg}}")
            # string(REPLACE " " ";" res3 "${${prefix}_${arg}}")
            # set (noValues_r ${res3})
            # set (noValues_r "${${prefix}_${arg}}")
        # endif()

   


    endforeach()
    # message("noValues_r = ${noValues_r}")

    # foreach(a ${noValues_r})
    #     message(${a})
    # endforeach()
    # # set(noValues_r ${noValues_r})
    # string (REPLACE ";" " " noValues_r "${noValues_r}")
    # set (noValues_r ${noValues_r})
    # message("noValues_r = ${noValues_r}")
    # string (REPLACE ";" " " singleValues_r ${singleValues_r})
    # set (noValues_r ${singleValues_r})

    # string (REPLACE ";" " " multiValues_r ${multiValues_r})
    # set (noValues_r ${multiValues_r})
    

    
    # message(${singleValue_r})
    # message(${multiValue_r})

    macro (bajskorven)
        # message (${ARGN})
        set(prefix       ARG_)
    set(option     ${option})
    set(oneValueArgs ${oneValueArgs})
    set(multiValueArgs  ${multiValueArgs})
        

        cmake_parse_arguments("${prefix}" "${options}" "${oneValueArgs}" "${multiValueArgs}" "${ARGN}") 

        foreach(arg IN LISTS oneValueArgs multiValueArgs)
        # Single argument values will print as a simple string
        # Multiple argument values will print as a list
        message("  ${arg} = ${${prefix}_${arg}}")
    endforeach()


        foreach(arg IN LISTS options)
            # message("  ${arg} = ${${prefix}_${arg}}")
            # message(${${prefix}_${arg}})
            if(${${prefix}_${arg}})
            # message("  ${arg} = ${${prefix}_${arg}}")
              message("  ${arg} enabled")
          else()
              message("  ${arg} disabled")
          endif()
        endforeach()

        

        foreach(arg IN LISTS oneValueArgs)
        # message("  ${arg} = ${${prefix}_${arg}}")
            # cmake_language(CALL ${arg} ${${prefix}_${arg}})
            # Single argument values will print as a simple string
            # Multiple argument values will print as a list
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




macro (ph_define_current_dir_name res)
   
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
