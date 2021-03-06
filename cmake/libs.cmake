
function(ph_boost target)
    cmake_parse_arguments(p "public;private;interface" "" "" ${ARGN})
    if (${ARGC} EQUAL "1" OR p_public)
        target_link_libraries (${target} PUBLIC ${Boost_LIBRARIES})
        target_include_directories (${target} PUBLIC ${Boost_INCLUDE_DIRS})
    elseif (p_private)
        target_link_libraries (${target} PRIVATE ${Boost_LIBRARIES})
        target_include_directories (${target} PRIVATE ${Boost_INCLUDE_DIRS})
    elseif(p_interface)
        target_link_libraries (${target} INTERFACE ${Boost_LIBRARIES})
        target_include_directories (${target} INTERFACE ${Boost_INCLUDE_DIRS})
    endif()
    
    
endfunction()
