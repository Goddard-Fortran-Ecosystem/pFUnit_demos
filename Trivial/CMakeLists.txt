cmake_minimum_required(VERSION 3.12)

project (PFUNIT_DEMO_TRIVIAL
  VERSION 1.0.0
  LANGUAGES Fortran)

find_package(PFUNIT)
enable_testing()

# system under test
add_library (sut
  square.F90
  )
target_include_directories(sut PUBLIC ${CMAKE_CURRENT_BINARY_DIR})

# tests
include (add_pfunit_ctest)

set (test_srcs test_square.pf)
add_pfunit_ctest (my_tests
  TEST_SOURCES ${test_srcs}
  LINK_LIBRARIES sut
  )
