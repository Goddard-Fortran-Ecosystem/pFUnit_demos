SRCS := square.F90
OBJS := $(SRCS:%.F90=%.o)

all: my_test

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

my_test: libsut.a

my_test_TESTS := test_square.pf
my_test_REGISTRY :=
my_test_OTHER_SOURCES :=
my_test_OTHER_LIBRARIES := -L. -lsut
my_test_OTHER_INCS :=

$(eval $(call make_pfunit_test,my_test))


clean:
	$(RM) *.o *.mod *.a *.inc test_square.F90
