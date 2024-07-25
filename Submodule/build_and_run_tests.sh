$!/bin/bash
set -e
[ -d build ] && rm -r build

mkdir build
cd build
cmake ..
make mytests
./test/mytests