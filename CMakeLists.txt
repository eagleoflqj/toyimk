cmake_minimum_required(VERSION 3.26)

project(Toyimk LANGUAGES Swift)

set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake" ${CMAKE_MODULE_PATH})

set(ARCH "native" CACHE STRING "Architecture to build")

set(VALID_ARCH native x86_64 arm64)

if(NOT ARCH IN_LIST VALID_ARCH)
    message(FATAL_ERROR "Invalid ARCH")
endif()

if(NOT ARCH STREQUAL "native")
    add_compile_options(-target "${ARCH}-apple-macos11")
endif()

add_executable(Toyimk
    MACOSX_BUNDLE
    src/server.swift
    src/controller.swift
)

set(APP_PATH "${CMAKE_CURRENT_BINARY_DIR}/Toyimk.app/Contents")

add_custom_command(TARGET Toyimk POST_BUILD
    COMMAND mkdir -p "${APP_PATH}/Resources"
    COMMAND cp dmg/toyimk.icns "${APP_PATH}/Resources"
    COMMAND cp dmg/toyimk-white.icns "${APP_PATH}/Resources"
    COMMAND cp -r dmg/en.lproj "${APP_PATH}/Resources"
    COMMAND rm -f "${APP_PATH}/MacOS/Toyimk.d"
    COMMAND "BUILD_DIR=${CMAKE_CURRENT_BINARY_DIR}" dmgbuild -s dmg/config.py Toyimk "${CMAKE_CURRENT_BINARY_DIR}/Toyimk.dmg"
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

install(TARGETS Toyimk
    BUNDLE DESTINATION "/Library/Input Methods"
)
