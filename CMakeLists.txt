# Root-level CMakeLists.txt for the codmiryoku workspace
cmake_minimum_required(VERSION 3.20.0)

# --------------------------------------------------------
# <<<  THIS IS THE CRITICAL ADDITION                     >>>
# Tell Zephyr where to look for custom boards/shields.
set(BOARD_ROOT ${CMAKE_CURRENT_LIST_DIR}/config)
# --------------------------------------------------------

# If you ever ship additional drivers or code as a Zephyr
# module, you could also set ZEPHYR_MODULES here, e.g.:
# set(ZEPHYR_MODULES ${CMAKE_CURRENT_LIST_DIR}/my_driver)

# Pull in Zephyr (this must stay *after* BOARD_ROOT)
find_package(Zephyr REQUIRED HINTS $ENV{ZEPHYR_BASE})

project(codmiryoku)

# Optional: add your config directory as its own CMake project
# add_subdirectory(config)
