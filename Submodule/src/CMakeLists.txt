project(stufflib LANGUAGES Fortran)

set(CMAKE_Fortran_FLAGS ${mylib_fortran_flags})
add_library(stuff ${CMAKE_CURRENT_SOURCE_DIR}/stuff.f90)