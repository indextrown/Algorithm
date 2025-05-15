//
//  2178-미로탐색.cpp
//  Algorithm
//
//  Created by 김동현 on 4/15/25.
//

/*
 https://www.acmicpc.net/problem/2178
 */
#include <iostream>
#include <queue>
#include <vector>
#include <tuple>
using namespace std;

/*
 BFS
 - 가중치는 어떤 위치로 가든 한칸이기 때문에 BFS로 접근하면 된다
 - 즉 가중치가 같은 MAP에서 최단거리로 사용할 수 있는 BFS를 사용 가능하다.
 - 가중치가 다르다면 최단 거리 알고리즘(다익스트라, 플로이드 워셜)을 사용해야한다
 
 1 0
 1 0
 
 
 */

const int max_n = 104;
const int dy[4] = {-1, 0, 1, 0};
const int dx[4] = {0, 1, 0, -1};
int n, m, y, x;
int maze[max_n][max_n];
int visited[max_n][max_n];

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL); cout.tie(NULL);
    freopen("input.txt", "r", stdin);
    
    cin >> n >> m;
    for (int i=0; i<n; i++) {
        string row;
        cin >> row;
        for (int j=0; j<m; j++) {
            maze[i][j] = row[j] - '0'; // 문자를 정수로 변환
        }
    }
    
    queue<pair<int, int>> q;
    visited[0][0] = 1; // 1. 방문처리를 하고
    q.push({0, 0});    // 2. push
    while(!q.empty()) {
        tie(y, x) = q.front(); q.pop();
        
        // 상하좌우 탐색
        for (int i=0; i<4; i++) {
            int ny = y + dy[i];
            int nx = x + dx[i];
            
            // 맵의 범위를 체크하고(오버플로우 체크), 건널수 없다면
            // 오버플로우를 체크하고 maze[ny][nx] == 0 체크하자
            if (ny<0 || ny>=n || nx<0 || nx>=m || maze[ny][nx] == 0) {
                continue;
            }
            
            // 이미 방문했다면 무시
            if (visited[ny][nx]) continue;
            
            visited[ny][nx] = visited[y][x] + 1;
            q.push({ny, nx});
        }
    }
    cout << visited[n-1][m-1] << "\n";

    return 0;
}
