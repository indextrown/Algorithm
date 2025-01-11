//
//  02.cpp
//  Algorithm
//
//  Created by 김동현 on 12/26/24.
//

#include <iostream>
#include <time.h>
#include <iomanip> // 고정 소수점 표기
using namespace std;

int main() {
    clock_t start, stop;
    double duration;
    
    start = clock();
    
    for (int i=0; i<10; i++) {
        cout << i << "\n";
    }
    
    stop = clock();
    
    duration = (double)(stop - start) / CLOCKS_PER_SEC;
    // cout << "수행시간은" << duration  << "초 입니다." << "\n";
    
    // 고정 소수점 표기 + 소수점 10자리까지 표시
    cout << fixed << setprecision(10) << "수행시간: " << duration << "초\n";
    
    return 0;
}
