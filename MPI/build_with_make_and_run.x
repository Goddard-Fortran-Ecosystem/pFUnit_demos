#!/bin/bash -f

make clean

if [[ ! $FC || -z $FC || $FC == " " ]]; then
    FC=mpifort make all
else
    make all
fi

mpirun -np 4 ./tests/test_halo


