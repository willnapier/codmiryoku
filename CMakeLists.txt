# Root CMakeLists.txt — tells Zephyr to treat `config/` as a module
cmake_minimum_required(VERSION 3.20.0)

# Add the config folder as a Zephyr module
add_subdirectory(config)
