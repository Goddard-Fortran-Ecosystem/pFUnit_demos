#!/bin/bash -f

make clean

make all

./tests/test_simple
./tests/broken_tests
./tests/disabled_test
./tests/error_handling




