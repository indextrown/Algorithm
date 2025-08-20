//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 8/21/25.
//

/*
 https://devjino.tistory.com/365
 
 조합(Combinutation) - "AB"와 "BA"가 같음 (순서 무관)
 arr = [1, 2, 3, 4, 5]
 index  0  1  2  3  4
 for (int i = 0; i < 5; i++) {
     for (int j = i+1; j < 5; j++) {
         cout << "(" << i << "," << j << ") ";
     }
 }
 i=0: j=1,2,3,4 → (0,1) (0,2) (0,3) (0,4)
 i=1: j=2,3,4   → (1,2) (1,3) (1,4)
 i=2: j=3,4     → (2,3) (2,4)
 i=3: j=4       → (3,4)
 i=4: j=없음    → 끝

 
 순열(Permutation) - 순열: "AB"와 "BA"가 다름 (순서 중요)
 for (int i = 0; i < 5; i++) {
     for (int j = 0; j < 5; j++) {
         if (i != j) {
             cout << "(" << i << "," << j << ") ";
         }
     }
 }
 i=0: j=1,2,3,4 → (0,1) (0,2) (0,3) (0,4)
 i=1: j=0,2,3,4 → (1,0) (1,2) (1,3) (1,4)  ← (1,0) 추가!
 i=2: j=0,1,3,4 → (2,0) (2,1) (2,3) (2,4)  ← (2,0) (2,1) 추가!
 i=3: j=0,1,2,4 → (3,0) (3,1) (3,2) (3,4)  ← (3,0) (3,1) (3,2) 추가!
 i=4: j=0,1,2,3 → (4,0) (4,1) (4,2) (4,3)  ← (4,0) (4,1) (4,2) (4,3) 추가!
 
 */

#include <iostream>
#include <algorithm>
using namespace std;

int main() {
    freopen("input.txt", "r", stdin);
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    
    int arr[9];
    int sum = 0;
    bool found = false;
    
    for (int i=0; i<9; i++) {
        cin >> arr[i];
        sum += arr[i];
    }
    
    for (int i=0; i<9 && !found; i++) {
        for (int j=i+1; j<9; j++) {
            if (sum - (arr[i] + arr[j]) == 100) {
                arr[i] = 0;
                arr[j] = 0;
                found = true;
                break;
            }
        }
    }
    
    sort(arr, arr + 9);
    
    for (const auto &num : arr) {
        if (num) {
            cout << num << "\n";
        }
    }
    
    return 0;
}
