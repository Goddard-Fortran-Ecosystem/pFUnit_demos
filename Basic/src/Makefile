SRCS := throw.F90 broken_sut.F90 working_sut.F90
OBJS := $(SRCS:%.F90=%.o)

all: libsut.a

libsut.a: $(OBJS)
	$(AR) -r $@ $?

%.o : %.F90
	$(FC) -c $(FFLAGS) $<

clean:
	$(RM) *.o *.mod *.a

