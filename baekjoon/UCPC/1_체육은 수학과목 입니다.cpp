//
//  1_체육은 수학과목 입니다.cpp
//  Algorithm
//
//  Created by 김동현 on 7/22/24.
//

#include <iostream>
using namespace std;

int a, b;

int main()
{
    freopen("input.txt", "r", stdin);
    cin.tie(NULL); ios_base::sync_with_stdio(false);
    cin >> a >> b;
    cout <<  min(a, b) * 100 / 2 << "\n";
    return 0;
}
