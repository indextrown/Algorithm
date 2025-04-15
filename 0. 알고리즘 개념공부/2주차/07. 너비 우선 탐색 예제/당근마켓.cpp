//
//  2.cpp
//  Algorithm
//
//  Created by 김동현 on 3/26/25.
//

/*
 가중치가 같은 그래프 내의 최단거리 알고리즘
 */

#include <iostream>
#include <queue>
using namespace std;

const int max_n = 104;
int dy[4] = {-1, 0, 1, 0};
int dx[4] = {0, 1, 0, -1};
int n, m, a[max_n][max_n], visited[max_n][max_n], y, x, sy, sx, ey, ex;

int main() {
    freopen("input.txt", "r", stdin);
    cin >> n >> m;      // map 크기
    cin >> sy >> sx;    // 승원이 좌표
    cin >> ey >> ex;    // 당근 좌표
    
    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            cin >> a[i][j];
        }
    }
    
    queue<pair<int, int>> q;
    
    q.push({sy, sx});
    
    while(q.size()) {
        tie(y, x) = q.front(); q.pop();
        for (int i=0; i<4; i++) {
            int ny = y + dy[i];
            int nx = x + dx[i];
            // 갈수 없는곳 무시
            if (ny<0 || ny>=n || nx<0 || nx>=m || a[ny][nx] == 0) {
                continue;
            }
            // 방문하였다면 무시
            if (visited[ny][nx]) continue;
            
            // 진행
            visited[ny][nx] = visited[y][x] + 1;
            q.push({ny, nx});
            
        }
    }
    
    cout << visited[ey][ex] << "\n";
    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            cout << visited[i][j] << " ";
        }
        cout << "\n";
    }
    
    
    return 0;
}
