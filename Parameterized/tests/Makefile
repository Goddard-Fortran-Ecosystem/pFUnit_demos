LATEST_PFUNIT_DIR := $(lastword $(shell echo $(wildcard $(PFUNIT_DIR)/PFUNIT-4.*) | xargs -n1 | sort -V))
include $(LATEST_PFUNIT_DIR)/include/PFUNIT.mk

all: trig_tests

%.o : %.F90
	$(FC) -c $(FFLAGS) $<

FFLAGS += $(PFUNIT_EXTRA_FFLAGS)
FFLAGS += -I../src

trig_tests := test_trig.pf
test_simple_OTHER_LIBRARIES := -L../src -lsut
$(eval $(call make_pfunit_test,trig_tests))

clean:
	$(RM) *.o *.mod *.a  *.inc
	$(RM) trig_tests test_trig.F90

