//
//  time.c
//  Algorithm
//
//  Created by 김동현 on 7/16/25.
//

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

int main(void)
{
    clock_t start, stop;
    double duration;
    start = clock();
    
    for (int i=0; i<1000; i++) {
        printf("test\n");
    }
    
    stop = clock();
    duration = (double)(stop - start) / CLOCKS_PER_SEC;
    printf("수행시간은 %f초입니다.\n", duration);
    
    return 0;
}

