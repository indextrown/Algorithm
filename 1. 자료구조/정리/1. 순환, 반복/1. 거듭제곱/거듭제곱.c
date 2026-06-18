//
//  거듭제곱.c
//  Algorithm
//
//  Created by 김동현 on 7/29/25.
//

#include <stdio.h>

int power(int x, int n) {
    int result = 1;
    
    for (int i=0; i<n; i++) {
        result *= x;
    }
    
    return result;
}

int main(void) {
    int result = power(2, 10);
    printf("%d\n", result);
    return 0;
}
