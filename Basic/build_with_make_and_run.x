#!/bin/bash -f

if [[ -d build ]]
then
    rm -rf build
fi

make all

./tests/test_simple
./tests/broken_tests
./tests/disabled_test
./tests/error_handling




