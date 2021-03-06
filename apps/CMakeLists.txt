add_executable(app app.cpp)
target_compile_features(app PRIVATE cxx_std_20)


set_target_properties(app PROPERTIES CXX_STANDARD 11)

target_link_libraries(app PRIVATE ${CMAKE_PROJECT_NAME})


