//
//  비트연산속도비교.cpp
//  Algorithm
//
//  Created by 김동현 on 7/21/24.
//

#include <stdio.h>
#include <time.h>

int main() {
    int n = 1024;
    clock_t start, end;
    double cpu_time_used;

    // 산술 연산으로 나누기
    start = clock();
    for (int i = 0; i < 100000000; i++) {
        int m = n / 2;
    }
    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("산술 연산: %f 초\n", cpu_time_used);

    // 비트 연산으로 나누기
    start = clock();
    for (int i = 0; i < 100000000; i++) {
        int m = n >> 1;
    }
    end = clock();
    cpu_time_used = ((double) (end - start)) / CLOCKS_PER_SEC;
    printf("비트 연산: %f 초\n", cpu_time_used);

    return 0;
}
