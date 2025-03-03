//
//  BFS.cpp
//  Algorithm
//
//  Created by 김동현 on 11/14/24.
//

#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int main() {
    vector<vector<int>> graph = {
        {1, 2},
        {0, 3, 4},
        {0, 4},
        {1, 5},
        {1, 2},
        {3}
    };
    
    vector<int> visited(graph.size(), false);
    queue<int> q;
    
    q.push(0);
    visited[0] = true;
    
    while (!q.empty()) {
        int node = q.front();
        q.pop();
        cout << "방문한 노드: " << node << "\n";
        
        for (const auto &neighbor : graph[node]) {
            if (!visited[neighbor]) {
                q.push(neighbor);
                visited[neighbor] = true;
            }
        }
    }
    return 0;
}
