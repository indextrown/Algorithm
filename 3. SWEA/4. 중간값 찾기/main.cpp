//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 11/16/24.
//

#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

int main() {
    ios_base::sync_with_stdio();
    cin.tie(NULL);
    freopen("input.txt", "r", stdin);
    
    int N;
    int arr[200] = {0};
    
    cin >> N;

    for (int i=0; i<N; i++) {
        cin >> arr[i];
    }
    
    //    sort(arr, arr+N); // 1번 방식
    nth_element(arr, arr+N/2, arr+N); // 2번 방식
    
    cout << arr[N/2] << "\n";
        
    return 0;
}



