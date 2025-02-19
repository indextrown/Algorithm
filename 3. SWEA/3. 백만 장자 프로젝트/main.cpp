//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 11/15/24.
//

#include <iostream>
#include <vector>
using namespace std;

int main() {
    ios_base::sync_with_stdio();
    cin.tie(NULL);
    freopen("input2.txt", "r", stdin);
    
    int T;
    cin >> T;
    
    for (int t=0; t<T; t++) {
        int N;
        cin >> N;
        
        vector<int> prices(N);
        for (int i=0; i<N; i++) {
            cin >> prices[i];
        }
        
        long long maxProfit = 0;
        int maxPrice = 0;
        
        for (int i=N-1; i>=0; i--) {
            if (prices[i] > maxPrice) {
                maxPrice = prices[i];
            } else {
                maxProfit += (maxPrice - prices[i]);
            }
        }
        cout << "#" << t+1 << " " << maxProfit << "\n";
    }
    return 0;
}



