//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 1/15/25.
//

#include <iostream>
#include <vector>
using namespace std;

const int n = 6;
vector<int> adj[6];
int visited[n];

void DFS2(int u){
    visited[u] = 1;
    cout << u << "\n";
    for(int v : adj[u]) {
        if(visited[v] == 0) {
            DFS2(v);
        }
    }
    cout << u << "로부터 시작된 함수가 종료되었습니다.\n";
    return;
}

void DFS(int here) {
    visited[here] = 1;
    cout << here << "\n";
    for (int there : adj[here]) {
        if (visited[there]) continue;
        DFS(there);
    }
}

int main() {
    adj[1].push_back(2);
    adj[1].push_back(3);
    adj[2].push_back(4);
    adj[4].push_back(2);
    adj[2].push_back(5);
    DFS(1);
}
