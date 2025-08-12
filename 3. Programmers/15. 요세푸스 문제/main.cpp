//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 8/12/25.
//

#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int main() {
    freopen("input.txt", "r", stdin);
    int n, k;
    queue<int> q;
    
    cin >> n >> k;
    for (int i=1; i<n+1; i++) q.push(i);
    
    cout << "<";
    while (!q.empty()) {
        for (int i=0; i<k-1; i++) {
            int front = q.front();
            q.pop();
            q.push(front);
        }
        
        cout << q.front();
        q.pop();
        if (!q.empty()) cout << ", ";
        
    }
    cout << ">\n";
    return 0;
}
