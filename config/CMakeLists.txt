# config/CMakeLists.txt

cmake_minimum_required(VERSION 3.20.0)

# Add this directory (config/) as a CMake module
zephyr_library()

# Register both halves of the Totem shield
board_runner_args(seeeduino_xiao_ble "--shield=totem_left")
board_runner_args(seeeduino_xiao_ble "--shield=totem_right")

# Register this directory as containing board definitions
add_board_directory(boards/shields)
