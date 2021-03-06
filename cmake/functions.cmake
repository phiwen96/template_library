cmake_minimum_required (VERSION 3.19.4)


macro (ph_gen_function function_name)
    set(prefix       ARG)
    set(noValues     NOVALS)
    set(singleValues OMEv)
    set(multiValues  ARGS_0 ARGS_1 ARGS_N)

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
        if (${arg} STREQUAL ARGS_0)
            list (APPEND noValues_r ${${prefix}_${arg}})
            # message (ARGS_0!!!!)
            # message (${${prefix}_${arg}})
        elseif (${arg} STREQUAL ARGS_1)
            list (APPEND singleValues_r ${${prefix}_${arg}})
        elseif (${arg} STREQUAL ARGS_N)
            list (APPEND multiValues_r ${${prefix}_${arg}})
        endif ()
        list (APPEND multiValues_r ${${prefix}_${arg}})
        # message("  ${arg} = ${${prefix}_${arg}}")
    endforeach()

    function (${function_name})

        foreach(arg IN LISTS noValues_r)
            message(${${prefix}_${arg}})
            if(${${prefix}_${arg}})
            
                message("  ${arg} enabled")
            else()
                message("  ${arg} disabled")
            endif()
        endforeach()

        

        foreach(arg IN LISTS singleValues_r)
            # cmake_language(CALL ${arg} ${${prefix}_${arg}})
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
    


