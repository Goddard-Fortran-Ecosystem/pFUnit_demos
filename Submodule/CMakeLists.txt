cmake_minimum_required(VERSION 3.2)
project(playground LANGUAGES Fortran)

# We want to build the library and test suite with these flags, but do not want these flags to be used for pFUnit.
set(mylib_fortran_flags "-cpp -fPIC -fdefault-real-8 -fdefault-double-8 -frecursive -Wno-unused-function -Wno-unused-variable")

add_subdirectory(${CMAKE_SOURCE_DIR}/src stufflib)
add_subdirectory(${CMAKE_SOURCE_DIR}/external/pFUnit)
add_subdirectory(${CMAKE_SOURCE_DIR}/test)