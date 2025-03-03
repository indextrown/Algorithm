//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 1/11/25.
//

#include <iostream>
#include <vector>
using namespace std;

const int V = 10;
vector<int> adj[V];
bool visited[V];

void go(int from) {
    visited[from] = 1;
    cout << from << "\n";
    
    //    for (int there: adj[from]) {
    //        if (!visited[there]) {
    //            go(there);
    //        }
    //    }
    
    for (int i=0; i<adj[from].size(); i++) {
        int there = adj[from][i];
        if (!visited[there]) {
            go(there);
        }
    }
}
int main() {
    
    adj[1].push_back(2);
    adj[2].push_back(1);
    
    adj[1].push_back(3);
    adj[3].push_back(1);
    
    adj[3].push_back(4);
    adj[4].push_back(3);
    

    
    for(int i = 0; i < 4; i++) {
        cout << i << " :: ";
        for(int j = 0; j < adj[i].size(); j++) {
            cout << adj[i][j] << " ";
        }
        cout << '\n';
    }
    
    for (int i=0; i<V; i++) {
        // 방문하지 않으면서 연결되어있다면 진행
        if (!visited[i] && adj[i].size()) {
            // 함수
            go(i);
        }
    }
    
    return 0;
}
 
