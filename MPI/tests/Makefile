USEMPI=YES
LATEST_PFUNIT_DIR := $(lastword $(shell echo $(wildcard $(PFUNIT_DIR)/PFUNIT-4.*) | xargs -n1 | sort -V))
include $(LATEST_PFUNIT_DIR)/include/PFUNIT.mk

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
	$(RM) test_halo

