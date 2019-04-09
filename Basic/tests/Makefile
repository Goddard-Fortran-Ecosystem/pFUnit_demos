include $(PFUNIT_DIR)/PFUNIT-4.0/include/PFUNIT.mk

all: test_simple broken_tests error_handling disabled_test

%.o : %.F90
	$(FC) -c $(FFLAGS) $<

FFLAGS += $(PFUNIT_EXTRA_FFLAGS)
FFLAGS += -I../src

my_tests_TESTS := test_simple.pf test_simple_fixture.pf
my_tests_OTHER_LIBRARIES := -L../src -lsut
$(eval $(call make_pfunit_test,test_simple))


broken_tests_TESTS := test_failing.pf
broken_tests_OTHER_LIBRARIES := -L../src -lsut
$(eval $(call make_pfunit_test,broken_tests))

error_handling_TESTS := test_error_handling.pf
error_handling_OTHER_LIBRARIES := -L../src -lsut
error_handling_OTHER_SRCS := throw_with_pfunit.F90
error_handling_EXTRA_USE := throw_with_pfunit_mod
error_handling_EXTRA_INITIALIZE := initialize_throw
$(eval $(call make_pfunit_test,error_handling))

error_handling_driver.o: throw_with_pfunit.o

disabled_test_TESTS := test_disable.pf
disabled_test_OTHER_LIBRARIES := -L../src -lsut
$(eval $(call make_pfunit_test,disabled_test))



clean:
	$(RM) *.o *.mod *.a  *.inc
	$(RM) test_simple.F90 test_failing.F90 test_error_handling.F90 test_disable.F90

