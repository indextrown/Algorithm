//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 1/4/25.
//

#include <iostream>
using namespace std;

const int n = 4;
bool a[n][n] = {
    {0, 1, 1, 1},
    {1, 0, 1, 0},
    {1, 1, 0, 0},
    {1, 0, 0, 0}
};

// C++에서 2차원 배열이 만들어질 때 행별로 캐싱이되어 빠르다(y축 중심으로 x축 탐색하자)
int main()
{
    for (int i=0; i<n; i++) {
        for (int j=0; j<n; j++) {
            if (a[i][j]) {
                cout << i << "부터 " << j << "까지 경로가 있습니다." << "\n";
            }
        }
    }
    return 0;
}
 
