SRCS := halo.F90
OBJS := $(SRCS:%.F90=%.o)

all: libsut.a

libsut.a: $(OBJS)
	$(AR) -r $@ $?

%.o : %.F90
	$(MPIF90) -c $(FFLAGS) $<

clean:
	$(RM) *.o *.mod *.a

