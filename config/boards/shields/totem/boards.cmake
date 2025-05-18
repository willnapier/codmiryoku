zephyr_library()

board_runner_args(seeeduino_xiao_ble "--shield=totem_left")
board_runner_args(seeeduino_xiao_ble "--shield=totem_right")

add_board_directory(${CMAKE_CURRENT_LIST_DIR}/..)
