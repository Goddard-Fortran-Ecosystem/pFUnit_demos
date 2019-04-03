# pFUnit Demonstration Project

**NOTE: Most of the examples are still under construction.  (Feel free
to contribute!)**

This repository contains a sequence of small self-contained examples
that demonstrate how to use pFUnit.  Most are intended to be built
with cmake and all assume that you already have installed pFUnit.

Generally within each directory, one can build with this sequence of
commands:

```
% mkdir build
% cd build
% cmake ..
% make tests
% ctest --verbose
```



## Examples:


### Trivial

      This demo provides a minimal SUT and test and ephasizes how to
      use CMake to access pFUnit.  Get this one working first before
      attempting the others - it will make sure that cmake is
      correctly finding your compiler, that you have a recent enough
      version of cmake, etc.

### Basic

      This demo uses a variety of basic pFUnit assertions.


### Fixtures

      This demo is a bit more complex and uses test "fixtures" with setUp() and tearDown().  Fixtures
      allow repeated initialization logic across tests in a suite and can help with releasing resources for
      failed tests.

### Parameterized

      This demo is relies on some advanced pFUnit capabilities to extend TestCase
      

### MPI

      This demo uses pFUnit's parallel capabilities and includes some
      advanced cases with fixtures and parameterized tests.


### GNUmake

      This trivial demo directly uses "make" directly rather than
      CMake, and is intended for projects that do not use CMake.  The
      other examples should still suffice for demonstrating how to use
      pFUnit features as test sources are not affected by the choice of
      build system.


