ifeq (nagfor,$(findstring nagfor,$(FC)))
  FFLAGS += -fpp
endif
export FFLAGS

include $(PFUNIT_DIR)/PFUNIT-4.0/include/PFUNIT.mk

FFLAGS += $(PFUNIT_EXTRA_FFLAGS)

all:
	$(MAKE) -C src all
	$(MAKE) -C tests all


%.o : %.F90
	$(FC) -c $(FFLAGS) $<



clean:
	$(MAKE) -C src clean
	$(MAKE) -C tests clean
