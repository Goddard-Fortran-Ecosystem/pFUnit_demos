
add_pfunit_ctest (mpi_tests
  TEST_SOURCES test_halo.pf
  LINK_LIBRARIES sut
  MAX_PES 4
  )

