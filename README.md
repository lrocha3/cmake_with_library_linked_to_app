Install MinGW (mingw32-base-bin and mingw32-gcc-g++-bin) and CMAKE.

Add the C:\Program Files\CMake\bin and C:\MinGW\bin to the environment variable PATH.

mkdir build
cd build
cmake .. -G "MinGW Makefiles"
mingw32-make

To create a .gitignore in windows do: cmd --> copy NUL .gitignore