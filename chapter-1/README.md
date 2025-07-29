# chapter-1

## Build C++ & CUDE with CMake
```
# Before
nvcc -std=c++11 -arch=sm_70 -o hello_cu hello.cu

# After(needs CMakeLists.txt file)
```
mkdir build
cd build
cmake ..
make
```
