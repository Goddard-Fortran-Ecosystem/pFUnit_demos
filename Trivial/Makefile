SRCS := square.F90
OBJS := $(SRCS:%.F90=%.o)

all: my_tests

libsut.a: $(OBJS)
	$(AR) -r $@ $?

ifeq (nagfor,$(findstring nagfor,$(FC)))
  FFLAGS += -fpp
endif

%.o : %.F90
	$(FC) -c $(FFLAGS) $<


include $(PFUNIT_DIR)/PFUNIT-4.0/include/PFUNIT.mk

FFLAGS += $(PFUNIT_EXTRA_FFLAGS)

test_square.o: square.mod
square.mod: square.o

my_tests: libsut.a

my_tests_TESTS := test_square.pf
my_tests_REGISTRY :=
my_tests_OTHER_SOURCES :=
my_tests_OTHER_LIBRARIES := -L. -lsut
my_tests_OTHER_INCS :=

$(eval $(call make_pfunit_test,my_tests))


clean:
	$(RM) *.o *.mod *.a *.inc test_square.F90
