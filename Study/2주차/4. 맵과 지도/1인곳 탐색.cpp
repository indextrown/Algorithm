//
//  main2.cpp
//  Algorithm
//
//  Created by 김동현 on 1/15/25.
//

/*
 - 왼쪽 상단부터 시작(0, 0은 무조건 1임을 보장)
 - 4방향 탐색 가능, 방문한 정점은 다시 방문하지 않는다   -> dydx, visited
 - 정점을 다 방문하면서(1인 곳만 갈 수 있음 )
 - 방문한 정점 출력
 
   1 0 1
   1 0 1
   0 1 1
 */

#include <iostream>
using namespace std;


const int n = 3;
int a[n][n], visited[n][n];
const int dy[] = {-1, 0, 1, 0};
const int dx[] = {0, 1, 0, -1};

void go(int y, int x) {
    visited[y][x] = 1;
    cout << y << " : " << x << "\n";
    
    // 4방향탐색
    for (int i=0; i<4; i++) {
        int ny = y + dy[i];
        int nx = x + dx[i];
        
        // 오버플로우 / 언더플로우 방지
        // 배열을 마이너스로 참고 못함, 선언한 배열을 넘어서 접근하지 못함
        if (ny<0 || ny>=n || nx<0 || nx>=n) continue;
        
        // 0은 갈 수 없다
        if (a[ny][nx] == 0) continue;
        
        // 방분한 정점은 갈 수 없다
        if (visited[ny][nx]) continue;
        go(ny, nx);
        
    }
}

int main() {
    freopen("input.txt", "r", stdin);
    for (int i=0; i<n; i++) {
        for (int j=0; j<n; j++) {
            cin >> a[i][j];
        }
    }
    go(0, 0);
    return 0;
}

