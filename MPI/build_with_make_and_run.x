#!/bin/bash -f

if [[ -d build ]]
then
    rm -rf build
fi

make all

mpirun -np 4 ./tests/test_halo


