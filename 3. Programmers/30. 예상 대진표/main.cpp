//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 11/13/25.
//

#include <iostream>
using namespace std;

int solution(int n, int a, int b)
{
    int answer = 0;
    
    while (a != b)
    {
        a = (a + 1) >> 1;
        b = (b + 1) >> 1;
        answer += 1;
    }
    
    return answer;
}
