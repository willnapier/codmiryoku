# config/boards/shields/totem/boards.cmake

# Define the list of available shields
set(SHIELD_LIST totem totem_left totem_right)

# Register this directory for ZMK to search for shields
add_board_directory(${CMAKE_CURRENT_LIST_DIR}/..)
