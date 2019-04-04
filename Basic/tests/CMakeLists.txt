
add_pfunit_ctest (my_tests
  TEST_SOURCES test_simple.pf test_pseudo_fixture.pf
  LINK_LIBRARIES sut
  )


add_pfunit_ctest (broken_tests
  TEST_SOURCES test_failing.pf
  LINK_LIBRARIES sut
  )

add_pfunit_ctest (error_handling
  TEST_SOURCES test_error_handling.pf
  OTHER_SOURCES throw_with_pfunit.F90
  LINK_LIBRARIES sut
  EXTRA_USE throw_with_pfunit_mod
  EXTRA_INITIALIZE initialize_throw
  )

add_pfunit_ctest (disabled_test
  TEST_SOURCES test_disable.pf
  )
