//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 3/25/25.
//

#include <iostream>
#include <vector>
#include <queue>
using namespace std;

vector<int> adj[100];
int visited[100];
// 어떤 노드들의 결과를 보고 싶은지를 정해놓은 목록 역할
int nodeList[] = {10, 12, 14, 16, 18, 20, 22, 24};

void bfs(int here) {
    queue<int> q;
    visited[here] = 1;   // 시작 노드를 방문 처리 (거리 0 + 1)
    q.push(here);
    
    while(q.size()) {   // 큐에 원소가 있을 동안 반복
        int here = q.front(); q.pop();
        
        // 현재 노드와 인접한 모든 노드를 확인
        for (int there: adj[here]) {
            if (visited[there]) continue;           // 방문한 정점은 무시
            visited[there] = visited[here] + 1;     // 방문하지 않은 노드의 거리를 현재 노드의 거리 +1로 갱신
            q.push(there);                          // 큐에 추가하여 이후 탐색 대상에 포함합니다.
        }
    }
}

int main() {
    // 그래프의 구조(연결 정보)를 구성
    adj[10].push_back(12);
    adj[10].push_back(14);
    adj[10].push_back(16);
    
    adj[12].push_back(18);
    adj[12].push_back(20);
    
    adj[20].push_back(22);
    adj[20].push_back(24);
    
    bfs(10);
    for (int i: nodeList) {
        cout << i << " : " << visited[i] << "\n";
    }
    
    cout << "10번부터 24번까지 최단거리는: " << visited[24] - 1 << "\n";
    return 0;
}
