add_executable(app MACOSX_BUNDLE app.cpp)
target_compile_features(app PRIVATE cxx_std_20)
set(APP_NAME app)


set_target_properties(app PROPERTIES CXX_STANDARD 20)

target_link_libraries(app PRIVATE ${CMAKE_PROJECT_NAME})

# Destination paths below are relative to ${CMAKE_INSTALL_PREFIX}
install(TARGETS ${APP_NAME}
    BUNDLE DESTINATION . COMPONENT Runtime
    RUNTIME DESTINATION bin COMPONENT Runtime
)

# Note Mac specific extension .app
set(APPS "\${CMAKE_INSTALL_PREFIX}/${APP_NAME}.app")

# Directories to look for dependencies
set(DIRS ${CMAKE_BINARY_DIR})

install(CODE "include(BundleUtilities)
    fixup_bundle(\"${APPS}\" \"\" \"${DIRS}\")")

set(CPACK_GENERATOR "DRAGNDROP")
include(CPack)
