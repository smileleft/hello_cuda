# chapter-1

## Build C++ & CUDE with CMake
```
# Before
nvcc -std=c++11 -arch=sm_70 -o hello_cu hello.cu

# After
cmake_minimum_required(VERSION 3.20 FATAL_ERROR)
project(hello_cuda LANGUAGES CXX CUDA)
 
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CUDA_STANDARD 20)
 
add_executable(hello_cu main.cu)
```
