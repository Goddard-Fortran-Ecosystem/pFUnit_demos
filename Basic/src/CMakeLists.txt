add_library(sut
  working_sut.F90
  broken_sut.F90
  throw.F90
  )

set_target_properties (sut PROPERTIES
  Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

target_include_directories(sut PUBLIC ${CMAKE_CURRENT_BINARY_DIR})
