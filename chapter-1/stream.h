cudaStream_t stream;
cudaStreamCreate(&stream);
 
int N = 100000;
size_t size = N * sizeof(float);
float *h_a, *h_b, *h_c;
float *d_a, *d_b, *d_c;
 
// 호스트 메모리 준비 (생략)
cudaMalloc(&d_a, size);
cudaMalloc(&d_b, size);
cudaMalloc(&d_c, size);
 
// Host->Device 복사 비동기 호출
cudaMemcpyAsync(d_a, h_a, size, cudaMemcpyHostToDevice, stream);
cudaMemcpyAsync(d_b, h_b, size, cudaMemcpyHostToDevice, stream);
 
// 커널 런칭 (비동기, stream에서 실행)
int threadsPerBlock = 256;
int blocks = (N + threadsPerBlock - 1) / threadsPerBlock;
vector_add_kernel<<<blocks, threadsPerBlock, 0, stream>>>(d_a, d_b, d_c, N);
 
// Device->Host 복사 비동기 호출
cudaMemcpyAsync(h_c, d_c, size, cudaMemcpyDeviceToHost, stream);
 
// 다른 Host-side 계산을 여기서 수행 가능 (GPU와 병렬)
// ... 다른 작업 ...
 
// 모든 작업 완료 대기
cudaStreamSynchronize(stream);
 
// 정리
cudaStreamDestroy(stream);
cudaFree(d_a); cudaFree(d_b); cudaFree(d_c);
