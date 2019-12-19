#!/bin/bash -f

make clean

make all

mpirun -np 4 ./tests/test_halo


