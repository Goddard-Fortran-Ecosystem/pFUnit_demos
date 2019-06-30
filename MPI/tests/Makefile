USEMPI=YES
include $(PFUNIT_DIR)/PFUNIT-4.0/include/PFUNIT.mk

all: test_halo

FFLAGS += $(PFUNIT_EXTRA_FFLAGS)
FFLAGS += -I../src

%.o : %.F90
	$(FC) -c $(FFLAGS) $<

test_halo_TESTS := test_halo.pf
test_halo_OTHER_LIBRARIES := -L../src -lsut
$(eval $(call make_pfunit_test,test_halo))


clean:
	$(RM) *.o *.mod *.a  *.inc
	$(RM) test_halo.F90

