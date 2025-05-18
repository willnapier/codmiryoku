# CMakeLists.txt at root of codmiryoku

cmake_minimum_required(VERSION 3.20.0)

# Let West/ZMK know where to find the custom shields
list(APPEND BOARD_ROOT ${CMAKE_CURRENT_SOURCE_DIR}/config)

# Let ZMK know where to find keymap overlays
list(APPEND ZMK_CONFIG ${CMAKE_CURRENT_SOURCE_DIR}/config)
