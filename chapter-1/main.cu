#include <cstdio>
 
// GPU에서 실행되는 커널 함수
__global__ void hello_kernel() {
    printf("Hello from the GPU!\\n");
}
 
int main() {
    // GPU 커널 런칭: 1개의 블록, 1개의 스레드
    hello_kernel<<<1,1>>>();
    // GPU 연산이 완료될 때까지 동기화
    cudaDeviceSynchronize();
    return 0;
}
