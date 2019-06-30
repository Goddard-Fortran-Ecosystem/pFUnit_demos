# pFUnit Demonstration Project

**
NOTE:
    Most of these examples are still under construction.  (Feel free
    to contribute!
**


This repository contains a sequence of small self-contained examples
that demonstrate how to use pFUnit.  Most are intended to be built
with cmake and all assume that you already have installed pFUnit.


First, set PFUNIT_DIR environment variable to the path where pFUnit
was installed.


Then, within each directory, one can build and execute the demo by
executing either

	./build_with_cmake_and_run.x

or

        ./build_with_make_and_run.x
	
from the command line.



## Examples:


### Trivial

      This demo provides a minimal SUT and test and ephasizes how to
      use CMake/Make to access pFUnit.  Get this one working first before
      attempting the others - it will make sure that cmake is
      correctly finding your compiler, that you have a recent enough
      version of cmake, etc.
      
### Basic

      This demo uses a variety of pFUnit features to illustrate basic
      capabilities.


### MPI

      This demo uses pFUnit's parallel capabilities and includes some
      advanced cases with fixtures and parameterized tests.




### Parameterized  (unimplemented)

      This demo is relies on some advanced pFUnit capabilities to
      demonstrate somewhat realistic parameterized test cases.
      

### fHamcrest (unimplemented)

      New and exciting way to write assertions.  More extensible and
      provides better error messages for complex combinations.



