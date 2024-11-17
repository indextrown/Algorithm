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
    
    int TC;
    
    cin >> TC;
    
    for (int tc=0; tc<TC; tc++) {
        //int arr[10] = {0,};
        
        string row;
        cin >> row;
        
        vector<int> arr(row.size());
        
        for (int i=0; i<row.size(); i++) {
            arr[i] = row[i]-'0';
        }
    }
    
}
