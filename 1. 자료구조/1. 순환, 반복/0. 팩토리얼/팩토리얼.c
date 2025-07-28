//
//  0. 팩토리얼.c
//  Algorithm
//
//  Created by 김동현 on 7/28/25.
//

#include <stdio.h>

int factorial(int n) {
    if (n <= 1) return 1;
    return n * factorial(n-1);
}

int factorial2(int n) {
    int result = 1;
    
    for (int i=1; i<=n; i++) {
        result *= i;
    }
    
    return result;
}

int main(void) {
    int result = factorial(3);
    printf("%d\n", result);
    
    int result2 = factorial2(3);
    printf("%d\n", result2);
}
