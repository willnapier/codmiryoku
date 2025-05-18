# config/boards/CMakeLists.txt

zephyr_include_directories(${CMAKE_CURRENT_SOURCE_DIR})
add_subdirectory_if_exists(${CMAKE_CURRENT_SOURCE_DIR}/shields)
