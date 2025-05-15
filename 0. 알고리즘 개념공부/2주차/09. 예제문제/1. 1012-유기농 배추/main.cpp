//
//  main.cpp
//  Algorithm
//
//  Created by 김동현 on 5/15/25.
//
// https://dev-mandos.tistory.com/5

/*
 Connected Component 개수 구하기(BFS, DFS 둘다 가능)
 - DFS가 코드가 적고 구현하기 조금 더 쉬움
 */

#include <iostream>
using namespace std;

int t;
int m, n, k; // 가로, 세로, 배추개수
int y, x;
int ret; // Connected Component 개수
int a[51][51];
bool visited[51][51];
int ny, nx;
int dy[4] = {-1, 0, 1, 0};
int dx[4] = {0, 1, 0, -1};

void dfs(int y, int x) {
    visited[y][x] = 1;
    
    for (int i=0; i<4; i++) {
        ny = y + dy[i];
        nx = x + dx[i];
        
        // 오버플로우면 무시
        if (ny<0 || ny>=n || nx<0 || nx>=m) continue;
        
        // 방문해야하면서 방문하지 않은 지역이면
        if (a[ny][nx] == 1 && visited[ny][nx] == 0) dfs(ny, nx);
    }
}

int main() {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL); cout.tie(NULL);
    freopen("input.txt", "r", stdin);
    
    cin >> t;
    
    while(t--) {
        fill(&a[0][0], &a[0][0] + 51 * 51, 0);
        fill(&visited[0][0], &visited[0][0] + 51 * 51, 0);
        ret = 0;
        
        cin >> m >> n >> k;
        for (int i=0; i<k; i++) {
            cin >> x >> y;
            a[y][x] = 1;
        }
        
        for (int i=0; i<n; i++) {
            for (int j=0; j<m; j++) {
                if (a[i][j]==1 && visited[i][j]==0) {
                    dfs(i, j);
                    ret++;
                }
            }
        }
        cout << ret << "\n";
    }
    return 0;
}


