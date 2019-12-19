
ifeq (nagfor,$(findstring nagfor,$(FC)))
  FFLAGS += -fpp
endif
export FFLAGS

LATEST_PFUNIT_DIR := $(lastword $(shell echo $(wildcard $(PFUNIT_DIR)/PFUNIT-4.*) | xargs -n1 | sort -V))
include $(LATEST_PFUNIT_DIR)/include/PFUNIT.mk
FFLAGS += $(PFUNIT_EXTRA_FFLAGS)

all:
	$(MAKE) -C src all
	$(MAKE) -C tests all


%.o : %.F90
	$(FC) -c $(FFLAGS) $<



clean:
	$(MAKE) -C src clean
	$(MAKE) -C tests clean
