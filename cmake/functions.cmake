cmake_minimum_required (VERSION 3.19.4)

function (ph_name current_dir ret)
    get_filename_component (${ret} ${current_dir} NAME)
    string(REPLACE " " "_" ret ${ret})
endfunction ()



function (ph_parent_dir current_dir ret)
    cmake_path (HAS_PARENT_PATH ${current_dir} has_parent)
    if (${has_parent})
        cmake_path (GET ${current_dir} PARENT_PATH ${ret})
    endif ()
endfunction ()


