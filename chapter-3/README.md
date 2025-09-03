# chapter-3

## How to Compile

```
nvcc -O2 -o perform_cuda perform_cuda.cu DS_timer.cpp
```

## Execute and Result

```
$ ./perform_cuda
1024 elements, memSize = 4096 bytes

*	 DS_timer Report 	*
* The number of timer = 5, counter = 5
**** Timer report ****
CUDA Total : 0.09900 ms
Computation(Kernel) : 0.07400 ms
Data Trans. : Host -> Device : 0.01400 ms
Data Trans. : Device -> Host : 0.01100 ms
VecAdd on Host : 0.00100 ms
**** Counter report ****
*	 End of the report 	*
GPU works well!
```
