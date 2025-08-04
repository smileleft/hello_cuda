#include <cstdio>

dim3 threadsPerBlock(16, 16);
dim3 blocks((N + threadsPerBlock.x - 1) / threadsPerBlock.x, (M + threadsPerBlock.y - 1) / threadsPerBlock.y);

 
__global__ void increment_kernel(int* d_val) {
    // 모든 스레드가 d_val[0]을 1 증가
    d_val[0] += 1;
}

__global__ void vector_add_kernel(const float* a, const float* b, float* c, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; 
    if (idx < N) {
        c[idx] = a[idx] + b[idx];
    }
}
 
int main() {
    int h_val = 10;          // Host 메모리에 있는 정수
    int* d_val = nullptr;    // Device 메모리 포인터
 
    // Device 메모리 할당
    cudaMalloc(&d_val, sizeof(int));
    // Host -> Device 복사
    cudaMemcpy(d_val, &h_val, sizeof(int), cudaMemcpyHostToDevice);
 
    // GPU 커널 런칭(블록 1개, 스레드 1개)
    increment_kernel<<<1,1>>>(d_val);
    // GPU 완료 대기
    cudaDeviceSynchronize();
 
    // Device -> Host 복사 (결과 가져오기)
    cudaMemcpy(&h_val, d_val, sizeof(int), cudaMemcpyDeviceToHost);
 
    printf("Result: %d\n", h_val); // 원래 10에서 +1 증가 -> 11 예상
 
    cudaFree(d_val);
    return 0;
}
