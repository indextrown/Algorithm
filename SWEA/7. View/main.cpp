//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 11/16/24.
//

#include <iostream>
#include <vector>
using namespace std;

int main() {
    ios_base::sync_with_stdio();
    cin.tie(NULL);
    freopen("input.txt", "r", stdin);
    
    int N;
    
    for (int tc=0; tc<10; tc++) {
        cin >> N;
        
        vector<int> arr(N, 0);
        for (int i=0; i<N; i++) {
            cin >> arr[i];
        }
        
        vector<int>safe(0);
        
        // 아파트 나열
        for (int i=2; i<N-2; i++) {
            int left = 0, right=0;
            // left
            if (arr[i] > arr[i-1] && arr[i] > arr[i-2]) {
                if (arr[i-1] > arr[i-2]) {
                    left = arr[i] - arr[i-1];
                } else {
                    left = arr[i] - arr[i-2];
                }
            }
            // right
            if (arr[i] > arr[i+1] && arr[i] > arr[i+2]) {
                if (arr[i+1] > arr[i+2]) {
                    right = arr[i] - arr[i+1];
                } else {
                    right = arr[i] - arr[i+2];
                }
            }
            
            if (left!=0 && right!=0)
                safe.push_back(min(left, right));
        }
        
        int sum = 0;
        for (const auto &i: safe) {
            sum +=i;
        }
        cout << "#" << tc+1 << " " << sum << "\n";
    }
}
