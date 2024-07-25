cmake_policy(SET CMP0074 NEW)

set(CMAKE_Fortran_FLAGS ${mylib_fortran_flags})

enable_testing()
file(GLOB UNITTEST_SRC ${CMAKE_CURRENT_SOURCE_DIR}/*.pf)
add_pfunit_ctest(mytests TEST_SOURCES ${UNITTEST_SRC} LINK_LIBRARIES stuff)
target_include_directories(mytests PRIVATE ${CMAKE_BINARY_DIR}/stufflib ${CMAKE_CURRENT_BINARY_DIR})