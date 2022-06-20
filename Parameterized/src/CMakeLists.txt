add_library(sut
  Trig.F90
  )

set_target_properties (sut PROPERTIES
  Fortran_MODULE_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR})

target_include_directories(sut PUBLIC ${CMAKE_CURRENT_BINARY_DIR})
target_include_directories(sut PUBLIC ${MPI_Fortran_INCLUDE_PATH})

