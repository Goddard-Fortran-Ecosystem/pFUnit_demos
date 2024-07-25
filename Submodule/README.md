# Example project using `pFUnit` with `add_submodule`

To build and run tests, execute the shell script `build_and_run_tests.sh`.

This is a minimal example of a project where we have some library, built from the files in `src/`, a test suite built from the files in `test/`, and would like to include `pFUnit` in
our project as a git submodule. Note that the `.gitmodules` file is located in the repository root (`..`). We want to build our library and tests with some set of flags/settings that should
not effect the building of `pFUnit`.

Building the project defined in `CMakeLists.txt` will compile the library, `pFUnit`, and the tests, such that this example should work also if you don't have an installed version of `pFUnit`.

Note: If you have installed `pFUnit`, and have defined the environment variable `PFUNIT_DIR`, you should `unset PFUNIT_DIR` before building the example, otherwise `cmake` seems to get confused.

The build system has been tested to work using
  * MacOS 12.5.1
  * gfortran 13.2.0 (Homebrew)
  * gcc 13.2.0 (Homebrew)
  * g++ 13.2.0 (Homebrew)
  * cmake 3.24.2
  * make 3.81
  * pFUnit 4.10
