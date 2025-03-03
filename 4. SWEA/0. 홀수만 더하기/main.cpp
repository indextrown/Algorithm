//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 11/13/24.
//

// 홀수만 더하기 - https://swexpertacademy.com/main/code/problem/problemDetail.do

#include <iostream>
using namespace std;

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL); cout.tie(NULL);
    freopen("input.txt", "r", stdin);
    
    int T;
    cin >> T;
    
    for (int i=0; i<T; i++) {
        int sum = 0;
        for (int j=0; j<10; j++) {
            int num = 0;
            cin >> num;
            if (num % 2 != 0) sum += num;
        }
        cout << "#" << i+1 << " " << sum << "\n";
    }
    
    return 0;
}
