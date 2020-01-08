#!/bin/bash


rm build38 -rf
rm build37 -rf
rm python/rlutilities -rf



# #for MSYS/GCC
# cd build_mingw
# cmake .. -G "MSYS Makefiles" -DWITH_TESTS=TRUE -DCMAKE_BUILD_TYPE=Release -DTARGET_LANGUAGE=both
# #cmake .. -G "MSYS Makefiles" -DWITH_TESTS=TRUE -DCMAKE_BUILD_TYPE=RelWithDebug -DTARGET_LANGUAGE=cpp
# make -j10

#for MSVC
mkdir build38
cd build38
cmake .. -G "Visual Studio 16 2019" -Ax64 -DWITH_TESTS=TRUE -DTARGET_LANGUAGE=python
cmake --build . --config Release
cd ..

mkdir build37
cd build37
cmake .. -G "Visual Studio 16 2019" -Ax64 -DWITH_TESTS=TRUE -DTARGET_LANGUAGE=python -DPYTHON_EXECUTABLE=/c/Users/Kris/AppData/Local/Programs/Python/Python37/python.exe
cmake --build . --config Release
cd ..

sh python_stubgen.sh

read -p "Press [Enter]"