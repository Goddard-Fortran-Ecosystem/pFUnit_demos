#!/bin/bash -f

if [[ -d build ]]
then
    rm -rf build
fi

make all
./my_tests


